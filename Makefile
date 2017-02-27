all:
	@echo "WARNING: This will replace current configuration."
	@echo "To install: make install"

install:
	@echo "Installing dotfiles..."
	@rm -f "$${HOME}/.vimrc"
	@ln -s "$$(pwd)/vim/.vimrc" "$${HOME}"
	@rm -f "$${HOME}/.shrc_yl"
	@ln -s "$$(pwd)/sh/.shrc_yl" "$${HOME}"
	@grep -q -F 'source ~/.shrc_yl' ~/.zshrc || echo 'source ~/.shrc_yl' >> "$${HOME}/.zshrc"
	@#grep -q -F 'source ~/.shrc_yl' ~/.bashrc || echo 'source ~/.shrc_yl' >> "$${HOME}/.bashrc"
	@echo "Installing Sublime Text settings..."
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
	@ln -s "$$(pwd)"/sublime_text/* "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/"

