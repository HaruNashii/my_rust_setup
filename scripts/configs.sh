#!/bin/bash


# Connect Git to your github account
git-credential-manager github login
# Set my git name as the same name as my PC User
git config --global user.name $(whoami)
# Set my default git initial branch as "main"
git config --global init.defaultBranch main


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


# Create my code directories
mkdir -p $HOME/Code/rust
# Create Aliases
echo "CODE=$HOME/Code" >> $HOME/.bashrc
echo "DOWNLOADS=$HOME/Downloads/" >> $HOME/.bashrc
