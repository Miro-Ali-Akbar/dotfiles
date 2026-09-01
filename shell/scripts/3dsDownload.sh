#!/bin/bash
set -euo pipefail

# Usage: ./dcim_ftp_download.sh YYYY-MM-DD [ftp_user] [ftp_password]
DATE_FROM="${1:?Usage: $0 YYYY-MM-DD [ftp_user] [ftp_password]}"
FTP_HOST="192.168.0.125"
FTP_PORT="5000"
FTP_USER="${2:-anonymous}"
FTP_PASS="${3:-anonymous}"
FTP_DIR="/dcim"
TARGET_DIR="$(pwd)"
TEMP_DIR="$(mktemp -d)"

# Convert YYYY-MM-DD to YYYY:MM:DD for exiftool comparison
EXIF_DATE="${DATE_FROM//-/:}"

cleanup() {
    rm -rf "$TEMP_DIR"
    rm -f /tmp/dcim_jpg_sorted.txt
}
trap cleanup EXIT

# Dependency checks
for cmd in lftp exiftool; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: '$cmd' is required but not installed." >&2
        exit 1
    fi
done

echo "Connecting to ftp://$FTP_HOST:$FTP_PORT$FTP_DIR ..."

lftp -u "$FTP_USER","$FTP_PASS" -p "$FTP_PORT" "ftp://$FTP_HOST" <<FTPEOF
set net:timeout 30
set net:max-retries 3
set ftp:passive-mode yes
mirror --parallel=4 --no-perms "$FTP_DIR" "$TEMP_DIR"
bye
FTPEOF

echo "Download complete. Filtering photos taken on or after $DATE_FROM ..."

# Collect JPG files with DateTimeOriginal >= date, sorted chronologically
TAB=$'\t'
exiftool -r -ext JPG \
    -if "\$DateTimeOriginal ge \"$EXIF_DATE\"" \
    -p "\$DateTimeOriginal${TAB}\$directory/\$filename" \
    "$TEMP_DIR" 2>/dev/null \
    | sort \
    > /tmp/dcim_jpg_sorted.txt

COUNT=$(wc -l < /tmp/dcim_jpg_sorted.txt)

if [[ "$COUNT" -eq 0 ]]; then
    echo "No photos found on or after $DATE_FROM."
    exit 0
fi

echo "Found $COUNT matching photos. Copying to $TARGET_DIR ..."

n=1
while IFS=$'\t' read -r dt filepath; do
    [[ -z "$filepath" ]] && continue
    base="${filepath%.*}"
    newnum=$(printf "%04d" $n)

    cp "$filepath" "$TARGET_DIR/HNI_${newnum}.JPG"

    if [[ -f "${base}.MPO" ]]; then
        cp "${base}.MPO" "$TARGET_DIR/HNI_${newnum}.MPO"
    fi

    ((n++))
done < /tmp/dcim_jpg_sorted.txt

echo "Done. $((n - 1)) shots saved to $TARGET_DIR (oldest = HNI_0001, newest = HNI_$(printf '%04d' $((n-1))))."
