# Vi mode
set editing-mode vi
# Show mode in vi
set show-mode-in-prompt on

# Cursors
$if term=linux
	set vi-ins-mode-string \1\e[?0c\2
	set vi-cmd-mode-string \1\e[?8c\2
$else
	set vi-ins-mode-string \1\e[6 q\2
	set vi-cmd-mode-string \1\e[2 q\2
$endif

# Two tabs become one
set show-all-if-ambiguous on


# Two tabs become one
set show-all-if-ambiguous on

# Autocomple = case insensitive
set completion-ignore-case On
