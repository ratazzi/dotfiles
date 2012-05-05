#!/bin/bash

# bootstrap environment without Dropbox

if [ ! -d "$HOME/.dotfiles" ]; then
    git clone git@github.com:ratazzi/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

if [ ! -d ".vim/bundle/vundle" ]; then
    git clone git://github.com/gmarik/vundle.git .vim/bundle/vundle
fi

# vim
ln -s "`pwd`/.vim" "$HOME/.vim"
ln -s "`pwd`/.vimrc" "$HOME/.vimrc"
vim +BundleInstall +qall

# zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
ln -s "`pwd`/.zshrc" "$HOME/.zshrc"

# tmux
ln -s "`pwd`/.tmux.conf" "$HOME/.tmux.conf"

# git
ln -s "`pwd`/.gitconfig" "$HOME/.gitconfig"

# python
ln -s "`pwd`/.pystartup.py" "$HOME/.pystartup.py"

echo
echo "\033[01;32mLet's rock.\033[00m"
exit 0
