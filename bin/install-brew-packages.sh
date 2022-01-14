#!/bin/bash

echo "Installing homebrew (mac package manager)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Brew installing various dependencies"
brew update

# install bash 5 and set as default shell
brew install bash
sudo echo "/usr/local/bin/bash" >> /etc/shells
chsh -s /usr/local/bin/bash

# version manager
brew install asdf

asdf plugin add java
asdf install java openjdk-11
asdf global java openjdk-11

brew install wget tree openssh openssl ffmpeg imagemagick htop tmux vim jq fzf telnet ripgrep docker neovim bat fd exa z bash bash-completion@2 gh gimp alacritty gpg2
brew install clojure/tools/clojure clojure-lsp/brew/clojure-lsp-native borkdude/brew/clj-kondo

asdf plugin add nodejs
asdf install nodejs latest 
asdf global nodejs latest

brew install yarn

# install fzf - fuzzy line completion
$(brew --prefix)/opt/fzf/install

source ~/.bashrc

