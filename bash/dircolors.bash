DIRCOLORS_SOLARIZED=$DOTFILES/opt/dircolors-solarized
[[ -h $HOME/.dircolors ]] && rm $HOME/.dircolors
ln -s $DIRCOLORS_SOLARIZED/dircolors.256dark $HOME/.dircolors
eval `dircolors -b $HOME/.dircolors`
