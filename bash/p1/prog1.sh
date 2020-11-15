#!/bin/sh
move_directory()
{
    local src=$1
    local dest=$2
    local osrc=$3
    local odest=$4
    
    # echo "Searching $src"

    for d in $src/*/ ; do
        if [[ $d != *"*"* ]]; then
            local fixed=${d//\/\//\/}

            local dr=${fixed/"$osrc"/"$odest"}

            # echo "Starting from $fixed to $dr with original $osrc and $odest"
            move_directory $fixed $dr $osrc $odest
        fi
    done

    if [[ ! -d "$src" ]]; then
        echo "$src not found"
        exit 0
    fi

    local filecount=$(($(ls -1q $src/*.c | wc -l)))
    local continue="true"
    
    if [[ $filecount -gt 3 ]]; then
        echo "There are more than 3 files in the directory $src:"
        ls $src/*.c
        read -p "Should these files be moved? [y/n] " -r
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            continue="false"
        fi
    fi

    if [[ $continue = "true" ]]; then
        # echo "Making $dest..."
        mkdir -p $dest

        # echo "Moving all source code files from $src to $dest..."

        mv $src/*.c $dest/
    fi
}

if [ "$#" -ne 2 ]; then
    echo "src and dest dirs missing"
    exit
fi

move_directory $1 $2 $1 $2
