#!/bin/bash

if cp ~/.bash_aliases .; then
    echo "Updated .bash_aliases"
fi
if cp ~/.bashrc .; then
    echo "Updated .bashrc"
fi
if cp ~/config .; then
    echo "Updated config"
fi
if cp ~/i3blocks.conf .; then
    echo "Updated i3blocks.conf"
fi
if cp ~/.tmux.conf .; then
    echo "Updated .tmux.conf"
fi
if cp ~/.vimrc .; then
    echo "Updated .vimrc"
fi

if cp ~/.config/powerline/colorschemes/tmux/solarized.json .; then
    echo "Updated powerline:solarized.json"
fi

if cp ~/.config/powerline/config.json .; then
    echo "Updated powerline:config.json"
fi
