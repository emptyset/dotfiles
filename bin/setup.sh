#!/usr/bin/env zsh

# iterate through all topics (exclude bin/ opt/)
# for each $TOPIC
#   symlink every non-directory $FILE
#     remove (or rename) existing $HOME/$FILE
#     $HOME/$FILE -> $HOME/$DOTFILES/$TOPIC/$FILE
#   symlink every non-directory private $FILE
#     remove (or rename) existing $HOME/$FILE
#     $HOME/$FILE -> $HOME/$DOTFILES/$TOPIC/private/$FILE
#   symlink every non-directory volatile $FILE
#     remove (or rename) existing $HOME/$FILE
#     $HOME/$FILE -> $HOME/$DOTFILES/$TOPIC/volatile/$FILE

DOTFILES=~/.dotfiles

#pushd $DOTFILES
#TOPICS=(${(f)$(find . -maxdepth 1 -type d -not \( -path . -o -path ./.git -o -path ./bin -o -path ./opt \))})
#for TOPIC in $TOPICS; do
#    echo "topic: $TOPIC"
#    pushd $TOPIC
#    TARGETS=(${(f)$(find . -maxdepth 1 -type f -not \( -name "*.bash" -o -name "*.alias" \))})
#    for TARGET in $TARGETS; do
#        echo "target: $TARGET"
#    done
#    popd
#done
#popd

set extendedglob
setopt null_glob

function list_targets {
    # TODO: globbing is not my friend today; perhaps an easier way to exclude files with certain suffixes
    eval "$1=(`print -l .*(.) .*(/) *(.e:'[[ ! ($REPLY =~ \.alias$) && ! ($REPLY =~ \.*sh$) ]]':) ^(private|volatile)*(/)`)"
}

function symlink_target {
    #echo "mv $HOME/$2 $HOME/tmp/$2.moved"
    #echo "ln -s $DOTFILES/$1/$2 $HOME/$2"
    echo "$2"
}

pushd $DOTFILES
TOPICS=(`print -l ./*(/e:'[[ $REPLY != "./bin" && $REPLY != "./opt" ]]':)`)
for TOPIC in $TOPICS; do
    # echo "topic: $TOPIC:t"
    FOLDERS=("$TOPIC:t")
    [[ -d "$TOPIC/private" ]] && FOLDERS+=("$TOPIC:t/private")
    [[ -d "$TOPIC/volatile" ]] && FOLDERS+=("$TOPIC:t/volatile")
    for FOLDER in $FOLDERS; do
        #echo "folder: $FOLDER"
        pushd $FOLDER
        TARGETS=()
        list_targets TARGETS
        for TARGET in $TARGETS; do
            symlink_target $TOPIC:t $TARGET:t
        done
        popd
    done
done
popd
