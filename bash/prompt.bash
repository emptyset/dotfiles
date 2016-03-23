export GITAWAREPROMPT=${DOTFILES}/opt/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="[\[$txtylw\]\w\[$txtrst\]] \n\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w# "
