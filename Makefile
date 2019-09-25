all:
	@echo "WARNING: This will replace current configuration files."
	@echo "To install: make [install] [vscode_macos]"

install:
	@echo "Removing existing files..."
	@rm -f "$${HOME}/.config/conky/conky.conf"
	@rm -f "$${HOME}/.config/terminator/config"
	@rm -f "$${HOME}/.gitconfig"
	@rm -f "$${HOME}/.gnupg/gpg.conf"
	@rm -f "$${HOME}/.tmux.conf"
	@rm -f "$${HOME}/.vimrc"
	@rm -f "$${HOME}/.yl_rc"

	@mkdir -p "$${HOME}/.gnupg"
	@mkdir -p "$${HOME}/.config/conky"
	@mkdir -p "$${HOME}/.config/terminator"

	@echo "Linking files..."
	@ln -s "$$(pwd)/home/.config/conky/conky.conf" "$${HOME}/.config/conky/conky.conf"
	@ln -s "$$(pwd)/home/.config/terminator/config" "$${HOME}/.config/terminator/config"
	@ln -s "$$(pwd)/home/.gitconfig" "$${HOME}/.gitconfig"
	@ln -s "$$(pwd)/home/.gnupg/gpg.conf" "$${HOME}/.gnupg/gpg.conf"
	@ln -s "$$(pwd)/home/.tmux.conf" "$${HOME}/.tmux.conf"
	@ln -s "$$(pwd)/home/.vimrc" "$${HOME}/.vimrc"
	@ln -s "$$(pwd)/home/.yl_rc" "$${HOME}/.yl_rc"

	@echo "Installing for bash and zsh..."
	@grep -q -F 'source ~/.yl_rc' ~/.bashrc || echo 'source ~/.yl_rc' >> "$${HOME}/.bashrc"
	@grep -q -F 'source ~/.yl_rc_local' ~/.bashrc || echo 'source ~/.yl_rc_local' >> "$${HOME}/.bashrc"
	@grep -q -F 'source ~/.yl_rc' ~/.zshrc || echo 'source ~/.yl_rc' >> "$${HOME}/.zshrc"
	@grep -q -F 'source ~/.yl_rc_local' ~/.zshrc || echo 'source ~/.yl_rc_local' >> "$${HOME}/.zshrc"

	@echo "Done"

vscode_settings_dir=$${HOME}/Library/Application Support/Code/User
vscode_macos:
	@echo "Installing VSCode files..."
	@rm -f "$(vscode_settings_dir)/settings.json"
	@rm -f "$(vscode_settings_dir)/keybindings.json"
	@ln -s "$$(pwd)/vscode/settings.json" "$(vscode_settings_dir)/"
	@ln -s "$$(pwd)/vscode/keybindings.json" "$(vscode_settings_dir)/"
	@echo "Done"
