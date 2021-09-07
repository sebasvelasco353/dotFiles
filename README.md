# After a clean PopOS install
Dotfiles collection for my Dotfiles configuration and instructions for installing the apps i use
every day on my PopOS installation.

First things first:
	sudo apt update && sudo apt upgrade

with this update the OS and should have no problem running the following commands for installing apps, so i start with the basics:

	sudo apt install gnome-tweak-tool
	sudo apt install curl
	sudo apt install -y code vlc
	sudo apt install -y libavcodec-extra libdvd-pkg; 
	sudo dpkg-reconfigure libdvd-pkg
	sudo apt install -y obs-studio

	# Neovim
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim

	# Vim Plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	# ripGrep
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
	sudo dpkg -i ripgrep_12.1.1_amd64.deb

	# google chrome:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt install ./google-chrome-stable_current_amd64.deb

	# NVM for node versions:
	curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
	source ~/.profile
	nvm --version  

	# Use NVM to install latest LTS version of node:
	nvm install --lts && node -v

	# Tmux:
	sudo apt-get install tmux

	# Alacritty:
	sudo apt install alacritty

	# Discord
	cd /tmp
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo apt install ./discord.deb

	# FreeCad && cura
	sudo apt-get install freecad
	sudo apt-get install cura

	# Kdenlive
	sudo add-apt-repository ppa:kdenlive/kdenlive-stable
	sudo apt update
	sudo apt install kdenlive

	# Calibre Ebook
	sudo apt install calibre
	
	# Spotify
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update && sudo apt-get install spotify-client

### Other installs that have to be done using the pop_Shop

	postman
	Steam
	drawio
	Figma
	Fritzing
	GNU image manipulation

### NPM installations

	npm install -g @vue/cli

### Inside nvim
	:plugInstall
	:CocInstall coc-tsserver coc-html coc-css coc-emmet



## Gnome extensions
- [Sound output device chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
- [User themes](https://extensions.gnome.org/extension/19/user-themes/)
- [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
- [transparent top panel](https://extensions.gnome.org/extension/2878/transparent-top-panel/)

## install the theme
to install the theme the only thing needed is to clone the repo of the theme you want on the .themes folder on the home directory (and create said folder), in mi case i like Juno so:

	cd && mkdir .themes && cd .themes
	git clone https://github.com/EliverLara/Juno.git

## TODO:
    - Automatic installations
    - cleanup
    - auto symlinks
