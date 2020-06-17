# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/.dotfiles/opt/google-cloud-sdk/path.zsh.inc ]; then
    . $HOME/.dotfiles/opt/google-cloud-sdk/path.zsh.inc;
fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/.dotfiles/opt/google-cloud-sdk/completion.zsh.inc ]; then
    . $HOME/.dotfiles/opt/google-cloud-sdk/completion.zsh.inc;
fi
