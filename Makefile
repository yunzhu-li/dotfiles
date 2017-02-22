all:
	@echo "WARNING: This will replace current configuration."
	@echo "To install: make install"

install:
	@echo "Installing files..."
	@rm -f ~/.vimrc
	@ln -s $$(pwd)/vim/.vimrc ~
	@rm -f ~/.shrc_yl
	@ln -s $$(pwd)/sh/.shrc_yl ~
	@grep -q -F 'source ~/.shrc_yl' ~/.zshrc || echo 'source ~/.shrc_yl' >> ~/.zshrc
	#@grep -q -F 'source ~/.shrc_yl' ~/.bashrc || echo 'source ~/.shrc_yl' >> ~/.bashrc

