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
if cp ~/.config/nvim/init.vim init.vim; then
    echo "Updated init.vim"
fi
if cp ~/.vim/UltiSnips/python.snippets UltiSnips; then
    echo "Updated .python.snippets"
fi

if cp ~/.spacemacs .; then
    echo "Updated .spacemacs"
fi

if cp ~/.config/powerline/colorschemes/tmux/solarized.json .; then
    echo "Updated powerline:solarized.json"
fi

if cp ~/.config/powerline/config.json .; then
    echo "Updated powerline:config.json"
fi

if cp /home/jiahong/.vim/.ycm_extra_conf.py .; then
    echo "Updated .ycm_extra_conf.py"
fi

if cp /home/jiahong/.config/Code/User/settings.json .; then
    echo "Updated Code/User/settings.json"
fi

if cp /home/jiahong/.config/Code/User/keybindings.json .; then
    echo "Updated Code/User/keybindings.json"
fi

test -d ~/.vscode/extensions/ && ls $_ > vscode_extensions.txt && echo "Updated vscode extensions list"
