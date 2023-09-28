#!/bin/bash

# bootstrap environment without Dropbox

DOTFILES="$HOME/.dotfiles"

[[ ! -x `which curl` ]] && echo -e "\033[01;31mcurl not found.\033[00m\n" && exit 1
[[ ! -x `which zsh` ]] && echo -e "\033[01;31mzsh not found.\033[00m\n" && exit 1
[[ ! -x `which vim` ]] && echo -e "\033[01;31mvim not found.\033[00m\n" && exit 1

if [ ! -d "$DOTFILES" ]; then
    git clone --recursive git://github.com/ratazzi/dotfiles.git $DOTFILES
fi

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $DOTFILES/.oh-my-zsh

ln -s "$DOTFILES/.oh-my-zsh" "$HOME/.oh-my-zsh"
ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc"

# tmux
ln -s "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

# git
ln -s "$DOTFILES/.gitconfig" "$HOME/.gitconfig"

# python
ln -s "$DOTFILES/.pystartup.py" "$HOME/.pystartup.py"

# vim
ln -s "$DOTFILES/.vim" "$HOME/.vim"
ln -s "$DOTFILES/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES/.vimrc" "$HOME/.gvimrc"
vim +PlugInstall +qall

echo -e "\n\033[01;32mLet's rock.\033[00m\n"
exit 0
