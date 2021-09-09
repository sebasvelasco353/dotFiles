# MacOS
this repo was created based on the course and recommendations of [Patrick McDonald](https://twitter.com/EIEIOxyz) in the udemy course [Dotfiles from Start to Finish-ish](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/?referralCode=445BE0B541C48FE85276)

## REMEMBER
after installing new casks (apps) with brew, if you want them to be automatically installed with the
install script remember to add them to the brew file using this command in the .dotfiles folder:
	brew bundle dump --force --describe

## Install using script
1. cd into the repo folder and run install script
	cd .dotfiles && ./install

2. after that finishes open nvim and install using plug
	:PlugInstall
	:call mkdp#util#install()

3. now you can install the CoC.vim extensions with something like:
	:CocInstall coc-json coc-tsserver coc-css coc-html coc-vetur coc-python coc-snippets coc-tailwindcss

4. install jedi (for the Coc configuration to work)
	pip3 install jedi

5. Grab a beer and enjoy.

## TODO:
- [] Finish the manual installation text
- [] Add global npm package.json file (where is it!?!?!)
- [] Add platformio plugin to VS Code or find a way to code, run, autocomplete and linter arduino in nvim


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

	# Lazygit:
	sudo add-apt-repository ppa:lazygit-team/release
	sudo apt-get update
	sudo apt-get install lazygit

	# google chrome:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt install ./google-chrome-stable_current_amd64.deb

	# NVM for node versions:
	curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
	source ~/.profile
	nvm --version  

	# Use NVM to install latest LTS version of node:
	nvm install --lts && node -v

	# install Zsh and Oh my zsh
	sudo apt install zsh
	chsh -s $(which zsh)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# clone zsh plugins to folder
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions.git
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

	# install powerlevel10k
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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

### Create symlinks
	ln -s ./nvim/init.vim ~/.config/nvim/
	ln -s ./nvim/which-key.vim ~/.config/nvim/

	ln -s ./alacritty ~/.config/

	ln -s ~/Documents/dotfiles/.zshrc ~/.zshrc
	ln -s ~Documents/dotfiles/.p10k.zsh ~/.p10k.zsh

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
