#!/bin/bash

if command -v apt &> /dev/null; then
	sudo apt install cargo tmux git wget
fi

if command -v pacman &> /dev/null; then
	# Install the Apps that i use while programming
	sudo pacman -Sy rustup neovim tmux git wget
	rustup default stable
else 
	# Install Neovim latest version direct from github to prevent plugins not working because of an old version of Neovim
	# Its inside the Pacman check, because if you don't have pacman so your distro may be not Bleeding Edge, and may have problems with the version of neovim
	# I know that exist others Bleeding Edges distros out there, but this scripts its not made for public use and i don't use these distros, so yeah...
	if command -v nvim &> /dev/null; then
		clear
		echo "Already Installed, Skipping..."
	else
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
		sudo rm -rf /opt/nvim
		sudo tar -C /opt -xzf nvim-linux64.tar.gz
		echo "export PATH="$PATH:/opt/nvim-linux64/bin"" >> $HOME/.bashrc
	fi
fi


# Install the latest GCM (Git Credential Manager) direct from the github if isn't already installed
if command -v git-credential-manager &> /dev/null; then
	clear
	echo "Already Installed, Skipping..."
else
	temp_folder_to_gcm="/tmp/rust_setup_tmp"
	link_to_download_gcm="$(curl -S https://api.github.com/repos/git-ecosystem/git-credential-manager/releases/latest | grep browser_download_url | cut -d\" -f4 | grep -v symbols | grep -v asc | grep gcm-linux_amd64.*.tar.gz)"
	
	if [ -d "$temp_folder_to_gcm" ]; then 
		mkdir $temp_folder_to_gcm
	fi

	cd $temp_folder_to_gcm
	wget $link_to_download_gcm

	sudo tar -xvf "$temp_folder_to_gcm/gcm*" -C /usr/local/bin
	git-credential-manager configure
	rm -rf $temp_folder_to_gcm
fi


clear
echo "All Installed, Now Running: Configs.sh - To Apply My Personal Configs for (Neovim, Tmux and Git)"


# Run config script to apply my configs for (Neovim, TMUX, Git)
# I recommend you to edit the git configuration in the "scripts/configs.sh", as it may be different as the way you setup it
if [ -d "$PWD/scripts" ]; then
	chmod a+x $PWD/scripts/configs.sh
	./scripts/configs.sh
fi

