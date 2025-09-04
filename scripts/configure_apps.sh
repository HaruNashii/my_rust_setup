#!/bin/bash



# Create my code directories
mkdir -p $HOME/Code/rust
mkdir -p $HOME/Code/bash

# Configure Git Credential Manager
git-credential-manager configure

# Connect Git to your github account
git-credential-manager github login

# ask and set my git name
clear
read -p "Your Github Name: " name
git config --global user.name $name

# Ask and set my git email
clear
read -p "Your Github Email: " email
git config --global user.email $email

# Set my default git initial branch as "main"
git config --global init.defaultBranch main

# apply my git-credential-manager (GCM) config
# MY CONFIG IS NOT SECURE, SO IF YOU NEED MORE PROTECTION PLEASE CHANGE IT
#---- This option works out of the box with any Graphical Interface, Window Manager and Operational System. (but it logout after some time)
#git config --global credential.credentialStore cache

#---- This option needs one graphical interface like "Gnome", "Kde" and Etc. ("Window Manager" won't work out of the box.)
#git config --global credential.credentialStore secretservice

#---- This option is not secure. if you use this, be careful!.
git config --global credential.credentialStore plaintext

#---- This option needs "gpd" and "pass" and configuration.
#git config --global credential.credentialStore gpg

# Install zsh-autosuggestions on oh-my-zsh config 
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then 
	echo "zsh-autosuggestions Already Installed, Skipping..."
else 
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Install my zsh config
if [ -f "$HOME/.zshrc" ]; then 
	mkdir -p $PWD/backups
	mv $HOME/.zshrc $PWD/backups
fi
if [ -f "$PWD/my_configs/zsh_config/.zshrc" ]; then
	cp $PWD/my_configs/zsh_config/.zshrc $HOME/
fi
chsh -s /bin/zsh

# Install my TMUX config 
if [ -d "$HOME/.config/tmux" ]; then 
	mkdir -p $PWD/backups
	mv $HOME/.config/tmux $PWD/backups
fi
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
echo "run $HOME/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux" >> $HOME/.config/tmux/tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf

# Install my Neovim config 
if [ -f "$PWD/my_configs/nvim/init.lua" ]; then
	clear
	# Save your config if exist
	if [ -d "$HOME/.config/nvim" ]; then
		mkdir -p $PWD/backups
		mv $HOME/.config/nvim $PWD/backups
	fi

	# Install my preferred Neovim Plugin Manager (Vim Plug) if isn't already installed
	if [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then 
		echo "Neovim Plugin Manager (Vim Plug, Already Installed, Skipping...)"
	else
		curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

	# Implement my config
	mkdir -p $HOME/.config/nvim
	cp -rf $PWD/my_configs/nvim/* $HOME/.config/nvim
	clear 
	echo "Remember to run 'PlugInstall' when you run Neovim for the first time"
else 
	echo "Not Applying Neovim Config, 'my_configs' folder not found, Please run the script while on the repo root directory"
fi


