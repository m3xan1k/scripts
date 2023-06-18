install:
	cp -R ./scripts ~/.local/bin
	echo "export PATH=${PATH}:${HOME}/.local/bin/scripts" >> ~/.bashrc

