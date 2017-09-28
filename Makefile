all:
	@echo "WARNING: This will replace current configuration files."
	@echo "To install: make install [subl_macos]"

install:
	@echo "Removing existing files..."
	@rm -f "$${HOME}/.yl_rc"
	@rm -f "$${HOME}/.vimrc"
	@rm -f "$${HOME}/.gnupg/gpg.conf"

	@echo "Linking dotfiles..."
	@ln -s "$$(pwd)/home/.yl_rc" "$${HOME}/.yl_rc"
	@ln -s "$$(pwd)/home/.vimrc" "$${HOME}/.vimrc"
	@ln -s "$$(pwd)/home/gnupg/gpg.conf" "$${HOME}/.gnupg/gpg.conf"

	@echo "Installing for zsh..."
	@echo "Remove git plugin from ~/.zshrc !"
	@grep -q -F 'source ~/.yl_rc' ~/.zshrc || echo 'source ~/.yl_rc' >> "$${HOME}/.zshrc"

subl_macos:
	@echo "Installing Sublime Text files..."
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"

	@ln -s "$$(pwd)/sublime_text/Preferences.sublime-settings" "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
	@ln -s "$$(pwd)/sublime_text/Default (OSX).sublime-keymap" "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
	@ln -s "$$(pwd)/sublime_text/Package Control.sublime-settings" "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"

zsh:
	@echo "Installing for zsh..."
	@echo "Remove git plugin from ~/.zshrc !"
	@grep -q -F 'source ~/.yl_rc' ~/.zshrc || echo 'source ~/.yl_rc' >> "$${HOME}/.zshrc"
