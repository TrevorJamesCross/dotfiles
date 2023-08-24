#!usr/bin/bash

# script to automate linking dotfiles after repo is cloned

# define directory paths
HOME_DIR="$HOME"
DOTFILES_DIR="$HOME_DIR/dotfiles"

# iterate directories
for dir in $DOTFILES_DIR/*/; do

    # remove "/" at the end of the path
    dir=${dir::-1}

    # check for vim directory
    if [ "$(basename $dir)" = "vim" ]; then
        ln -sfvn "$dir" "$HOME_DIR/.$(basename $dir)"
        continue
    fi

    # iterate files in dir
    for file in $dir/*; do

         # link file
         ln -sfv "$file" "$HOME_DIR/.$(basename $file)"

    done
done
