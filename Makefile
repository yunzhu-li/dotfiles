all:
	@echo "WARNING: This will replace current configuration files."
	@echo "To install: make [install] [vscode_macos]"

install:
	@echo "Removing existing files..."
	@rm -f "$${HOME}/.yl_rc"
	@rm -f "$${HOME}/.vimrc"
	@rm -f "$${HOME}/.gnupg/gpg.conf"

	@echo "Linking dotfiles..."
	@ln -s "$$(pwd)/home/.yl_rc" "$${HOME}/.yl_rc"
	@ln -s "$$(pwd)/home/.vimrc" "$${HOME}/.vimrc"
	@ln -s "$$(pwd)/home/.gnupg/gpg.conf" "$${HOME}/.gnupg/gpg.conf"

	@echo "Installing for zsh..."
	@echo "Remember to remove git plugin from ~/.zshrc !"
	@grep -q -F 'source ~/.yl_rc' ~/.zshrc || echo 'source ~/.yl_rc' >> "$${HOME}/.zshrc"
	@grep -q -F 'source ~/.yl_rc_private' ~/.zshrc || echo 'source ~/.yl_rc_private' >> "$${HOME}/.zshrc"

	@echo "Done"

vscode_settings_dir=$${HOME}/Library/Application Support/Code/User
vscode_macos:
	@echo "Installing VSCode files..."
	@rm -f "$(vscode_settings_dir)/settings.json"
	@rm -f "$(vscode_settings_dir)/keybindings.json"
	@ln -s "$$(pwd)/vscode/settings.json" "$(vscode_settings_dir)/"
	@ln -s "$$(pwd)/vscode/keybindings.json" "$(vscode_settings_dir)/"
	@echo "Done"
