#!/bin/bash



if command -v apt &> /dev/null; then
	# Install the Apps that i use while programming
	sudo apt install ranger tmux git wget zsh
fi

if command -v pacman &> /dev/null; then
	# Install the Apps that i use while programming
	sudo pacman -Sy --needed ranger tmux git wget zsh
fi

if command -v dnf &> /dev/null; then 
	# Install the Apps that i use while programming
	sudo dnf install ranger tmux git wget zsh
fi

# Install Oh-My_Zah with the official download command from (https://ohmyz.sh/#install)
if command -v omz &> /dev/null; then
	clear
	echo "Already Installed, Skipping..."
else
	
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Neovim latest version direct from github to prevent plugins not working because of an old version of Neovim
if command -v nvim &> /dev/null; then
	clear
	echo "Already Installed, Skipping..."
else
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
fi

# Install rustup latest version from the official site (https://rustup.rs/)
if command -v cargo &> /dev/null; then 
	clear 
	echo "Already Installed, Skipping..."
else 
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install the latest GCM (Git Credential Manager) direct from the github if isn't already installed
if command -v git-credential-manager &> /dev/null; then
	clear
	echo "Already Installed, Skipping..."
else
	temp_folder_to_gcm="/tmp/rust_setup_tmp"
	link_to_download_gcm="$(curl -S https://api.github.com/repos/git-ecosystem/git-credential-manager/releases/latest | grep browser_download_url | cut -d\" -f4 | grep -v symbols | grep -v asc | grep gcm-linux_amd64.*.tar.gz)"
	
	mkdir -p $temp_folder_to_gcm
	cd $temp_folder_to_gcm
	wget $link_to_download_gcm

	sudo tar -xvf "$temp_folder_to_gcm/gcm*" -C /usr/local/bin
	git-credential-manager configure
 	cd $HOME
	rm -rf $temp_folder_to_gcm
fi

clear
echo "All Installed, Now Please Run configure_apps.sh - To Apply My Personal Configs for (Neovim, Tmux, Oh-My-Zsh and Git)"
