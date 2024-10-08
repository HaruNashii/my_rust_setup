#!/bin/bash


# Create my code directories
mkdir -p $HOME/Code/rust
mkdir -p $HOME/Code/bash


# Move my script to create a new github repo to work with my alias
if [ -f "$HOME/Code/bash/git_init_repo.sh" ]; then 
	echo "File already exist, Skipping..."
else
	cp $PWD/scripts/git_init_repo.sh $HOME/Code/bash/
fi


# Create Aliases
echo "CODE=$HOME/Code" >> $HOME/.bashrc
echo "DOWNLOADS=$HOME/Downloads/" >> $HOME/.bashrc
echo "NEW_GIT_REPO=sh $HOME/Code/bash/git_init_repo.sh" >> $HOME/.bashrc


# Connect Git to your github account
git-credential-manager github login
# Set my git name as the same name as my PC User
git config --global user.name $(whoami)
# Ask and set my git email
clear
read -p "Your Email: " email
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


# Install my TMUX config 
if [ -d "$HOME/.config/tmux" ]; then 
	mkdir $PWD/backups
	mv $HOME/.config/tmux $PWD/backups
fi
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
echo "run $HOME/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux" >> $HOME/.config/tmux/tmux.conf


# Install my Neovim config 
if [ -f "$PWD/my_configs/init.lua" ]; then
	clear
	# Save your config if exist
	if [ -d "$HOME/.config/nvim" ]; then
		mkdir $PWD/backups
		mv $HOME/.config/nvim $PWD/backups
	fi

	# Install my preferred Neovim Plugin Manager (Vim Plug) if isn't already installed
	if ![ -d ".local/share/nvim/site/autoload/plug.vim" ]; then 
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	fi

	# Implement my config
	mkdir $HOME/.config/nvim
	cp $PWD/my_configs/init.lua $HOME/.config/nvim
	clear 
	echo "Remember to run 'PlugInstall' when you run Neovim for the first time"
else 
	echo "Not Applying Neovim Config, 'my_configs' folder not found, Please run the script while on the same directory as the script"
fi


