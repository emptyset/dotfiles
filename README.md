# overview
- simple dotfiles management
- dotfiles are divided into three categories: *public*, *private*, and *volatile*
    - *public* files have no sensitive information, suitable for hosting on github
    - *private* files have sensitive information
    - *volatile* files change frequently
- `private` and `volatile` files are `.gitignore`'d
- dotfiles are organized by topic, with a typical folder structure:
    - `.dotfiles/topic`
    - `.dotfiles/topic/private`
    - `.dotfiles/topic/volatile`
- top-level `private` and `volatile` directories for one-off or minor topics:
    -  `.dotfiles/private`
    - `.dotfiles/volatile`
- run `.dotfiles/bin/setup.sh` to bootstrap everything
    - each `file`, with or without dot prefix, in all folders is symlinked via `$HOME/file`
- shells like `zsh` and `bash` have some special files, which are sourced by the appropriate `*rc` file:
    - `*.zsh` or `*.bash` files to configure a specific sub-topic
    - `*.alias` files to setup aliases a specific sub-topic
- etc.

# examples
- store any dotfile that has references to sensitive company information in `.dotfiles/company/private`

# notes
- `.dotfiles/opt` contains package-like-things that should be fetched
    - `.dotfiles/bin/opt-pull.sh` runs commands to fetch the "packages"
