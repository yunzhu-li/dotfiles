all:
	@echo "WARNING: This will replace current configuration."
	@echo "To install: make install"

install:
	@echo "Installing dotfiles..."
	@rm -f "$${HOME}/.vimrc"
	@ln -s "$$(pwd)/vim/.vimrc" "$${HOME}"
	@rm -f "$${HOME}/.yl_rc"
	@ln -s "$$(pwd)/sh/.yl_rc" "$${HOME}"
	@grep -q -F 'source ~/.yl_rc' ~/.zshrc || echo 'source ~/.yl_rc' >> "$${HOME}/.zshrc"
	@#grep -q -F 'source ~/.yl_rc' ~/.bashrc || echo 'source ~/.yl_rc' >> "$${HOME}/.bashrc"
	@echo "Installing Sublime Text settings..."
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
	@ln -s "$$(pwd)"/sublime_text/* "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/"

