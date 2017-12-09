BASHRC=~/.bashrc
VIMRC=~/.vimrc

java_compile_run() {
    javac $1 -Xlint
    prog=$(echo $1 | sed s/\.java/""/g)
    java $prog
}

java_clean() {
    rm *.class
}

toggle_theme() {
    if grep -qi base16_solarized-dark $BASHRC
    then
        # either toggle to light mode
        sed -ri 's/^base16_solarized-dark$/base16_solarized-light/g' $BASHRC
        sed -ri 's/^(\s*)colorscheme base16-tomorrow-night$/\1colorscheme base16-solarized-light/g' $VIMRC
        sed -ri "s/^(\s*)\"\s(let g:airline_theme='sol')/\1\2/g" $VIMRC
    else
        # or toggle to dark mode
        sed -ri 's/^base16_solarized-light$/base16_solarized-dark/g' $BASHRC
        sed -ri 's/^(\s*)colorscheme base16-solarized-light$/\1colorscheme base16-tomorrow-night/g' $VIMRC
        sed -ri "s/^(\s*)(let g:airline_theme='sol')/\1\" \2/g" $VIMRC
    fi
}


# git shenanigans
alias yolo='git add --all && git commit -m "deal with it"'

# java shortcuts
alias jcc='java_compile_run'
alias jclr='java_clean'

# bash commands
alias here='pwd | xargs echo -n | xclip -sel clip'
alias backup="rsync -avz --delete --exclude '.cache' /home/jiahong/ /backup/ | egrep -i \"failed|error|warning\""
alias backupv="rsync -avz --delete --exclude '.cache' /home/jiahong/ /backup/"
alias togglet='toggle_theme'
