#!/bin/bash

# bootstrap environment without Dropbox

[[ ! -x `which zsh` ]] && echo -e "\033[01;31mzsh not found.\033[00m\n" && exit 1
[[ ! -x `which vim` ]] && echo -e "\033[01;31mvim not found.\033[00m\n" && exit 1

if [ ! -d "$HOME/.dotfiles" ]; then
    git clone git://github.com/ratazzi/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
fi

# zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.dotfiles/.oh-my-zsh
fi
ln -s "`pwd`/.oh-my-zsh" "$HOME/.oh-my-zsh"
ln -s "`pwd`/.zshrc" "$HOME/.zshrc"

# tmux
ln -s "`pwd`/.tmux.conf" "$HOME/.tmux.conf"

# git
ln -s "`pwd`/.gitconfig" "$HOME/.gitconfig"

# python
ln -s "`pwd`/.pystartup.py" "$HOME/.pystartup.py"

if [ ! -d ".vim/bundle/vundle" ]; then
    git clone git://github.com/gmarik/vundle.git .vim/bundle/vundle
fi

# vim
ln -s "`pwd`/.vim" "$HOME/.vim"
ln -s "`pwd`/.vimrc" "$HOME/.vimrc"
ln -s "`pwd`/.vimrc" "$HOME/.gvimrc"
vim +BundleInstall +qall

echo -e "\n\033[01;32mLet's rock.\033[00m\n"
exit 0
