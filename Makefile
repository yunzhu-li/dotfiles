all:
	@echo "WARNING: This will replace current configuration files."
	@echo "To install: make install [{zsh, bash}] [subl_macos]"

install:
	@echo "Linking dotfiles..."
	@rm -f "$${HOME}/.vimrc"
	@ln -s "$$(pwd)/vim/.vimrc" "$${HOME}"
	@rm -f "$${HOME}/.yl_rc"
	@ln -s "$$(pwd)/sh/.yl_rc" "$${HOME}"
	@rm -f "$${HOME}/.hyper.js"
	@ln -s "$$(pwd)/hyper/.hyper.js" "$${HOME}"

subl_macos:
	@echo "Installing Sublime Text settings..."
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
	@rm -f "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/_dock_icons"
	@ln -s "$$(pwd)"/sublime_text/* "$${HOME}/Library/Application Support/Sublime Text 3/Packages/User/"

zsh:
	@echo "Installing for zsh..."
	@grep -q -F 'source ~/.yl_rc' ~/.zshrc || echo 'source ~/.yl_rc' >> "$${HOME}/.zshrc"

bash:
	@echo "Installing for bash..."
	@grep -q -F 'source ~/.yl_rc' ~/.bashrc || echo 'source ~/.yl_rc' >> "$${HOME}/.bashrc"

