#!/bin/bash

echo "install plug for local plugins. run - :PlugInstall"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "symlinks .tmux.conf and .vimrc along with others to your directory so that updates are easy to setup"
ln -s $(pwd)/conf/.tmux.conf  ~/.tmux.conf
ln -s $(pwd)/conf/.vimrc ~/.vimrc

echo "Linking in tmux init sessions"
ln -s $(pwd)/conf/tmux ~/.tmux

echo "Setting up global gitignore"
git config --global core.excludesfile $(pwd)/conf/.gitignore_global

echo "Setting up vim tmp folder"
mkdir ~/tmp

