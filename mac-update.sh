#!/bin/bash

if cp ~/.bash_aliases .bash_aliases_mac; then
    echo "Updated .bash_aliases"
fi
if cp ~/.bashrc .bashrc_mac; then
    echo "Updated .bashrc"
fi
if cp ~/.bash_profile .bash_profile_mac; then
    echo "Updated .bash_profile"
fi
if cp ~/config .config_mac; then
    echo "Updated config"
fi
if cp ~/.tmux.conf .tmux.conf_mac; then
    echo "Updated .tmux.conf"
fi
if cp ~/.vimrc .vimrc_mac; then
    echo "Updated .vimrc"
fi
if cp ~/.config/nvim/init.vim init.vim_mac; then
    echo "Updated init.vim"
fi
if cp ~/.vim/UltiSnips/python.snippets UltiSnips; then
    echo "Updated .python.snippets"
fi
if cp ~/.ideavimrc .ideavimrc_mac; then
    echo "Updated .ideavimrc"
fi
