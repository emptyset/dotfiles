DIRCOLORS_SOLARIZED=${DOTFILES}/opt/dircolors-solarized
eval `dircolors $DIRCOLORS_SOLARIZED/dircolors.256dark`

#echo "4"
# setup prompt
export GITAWAREPROMPT=$DOTFILES_ROOT/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="[\[$txtylw\]\w\[$txtrst\]] \n\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w# "
