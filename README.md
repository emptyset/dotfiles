# overview
- simple dotfiles management
- dotfiles are divided into three categories: *public*, *private*, and *volatile*
    - *public* files have no sensitive information, suitable for hosting on github
    - *private* files have sensitive information
    - *volatile* files change frequently
- dotfiles are organized by topic, with a typical folder structure:
    - `.dotfiles/topic`
    - `.dotfiles/topic/private`
    - `.dotfiles/topic/volatile`
- top-level `private` and `volatile` directories for one-off or minor topics:
    - `.dotfiles/private`
    - `.dotfiles/volatile`
- each `file`, with or without dot prefix, in each topic, is symlinked via `$HOME/file`
- etc.

# usage

    $ cd ~/.dotfiles
    $ bin/setup.sh

# examples
- store any dotfile that has references to sensitive company information in `.dotfiles/company/private`

# notes
- `private` and `volatile` directories are `.gitignore`'d
- `.dotfiles/opt` contains package-like-things that should be fetched
    - `.dotfiles/bin/opt-pull.sh` runs commands to fetch the "packages"
- added `company` explicitly to `.git/info/exclude` to keep out of public repo
- `.dotfiles/bin/setup.sh` uses [stow](http://www.gnu.org/software/stow/manual/stow.html) to manage symlinks
- shells like `zsh` and `bash` have some special files, which are sourced by the appropriate `*rc` file:
    - `*.zsh` or `*.bash` files to configure a specific sub-topic
    - `*.alias` files to setup aliases on a specific sub-topic
