.PHONY: nvim

nvim:
	@echo "install nvim config"
	ln -s "$(CURDIR)/nvim" ~/.config/
