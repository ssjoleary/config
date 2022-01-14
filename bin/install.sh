# inspired by https://gist.github.com/mislav/5706063

echo "Creating config directories"
mkdir ~/bin
mkdir ~/.config
mkdir ~/.config/nvim
mkdir ~/.config/alacritty

echo "Creating vimrc and tmux conf files"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/.vimrc" -o  ~/.vimrc

echo "Linking vimrc for neovim"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/init.vim" -o  ~/.config/nvim/init.vim

echo "Creating .git-prompt.sh"
curl -fsSL "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" -o ~/.git-prompt.sh

echo "Creating .prompt"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/.prompt" -o  ~/.prompt

echo "Creating .tmux.conf"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/.tmux.conf" -o  ~/.tmux.conf

echo "Setting up tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Creating alacritty.yml"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/alacritty.yml" -o  ~/.config/alacritty/alacritty.yml

echo "Bash aliases"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/.bash_aliases" >> ~/.bash_aliases

echo "Adding alias' to bashrc"
curl -fsSL "https://raw.githubusercontent.com/ssjoleary/config/master/conf/setup_bash_aliases" >> ~/.bashrc

echo "Getting leiningen"
curl -fsFL "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" >> ~/bin
chmod +x ~/bin/lein
