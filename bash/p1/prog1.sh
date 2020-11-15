#!/bin/sh
move_directory()
{
    local src=$1
    local dest=$2
    local osrc=$3
    local odest=$4
    local layer=$(($5+1))

    # echo "Moving all source code files from $src to $dest..."

    if [[ ! -d "$src" ]]; then
        echo "<src-dir> not found"
        exit 0
    fi

    # echo "Making $dest..."
    mkdir -p $dest

    mv $src/*.c $dest/
    
    # echo "Searching $src"

    for d in $src/*/ ; do
        if [[ $d != *"*"* ]]; then
            # echo "${d%?} and ${d#?}"
            # [[ "$d" =~ ((\/[a-zA-Z0-9\/]+)+) ]] && echo "${BASH_REMATCH[1]}"
            local fixed=${d//\/\//\/}
            # echo "$d;HEY;$fixed"
        fi
    done

    for d in $src/*/ ; do
        if [[ $d != *"*"* ]]; then
            # local dr=${d#"$src/"}
            local fixed=${d//\/\//\/}

            local dr=${fixed/"$osrc"/"$odest"}
            
            # [[ "$d" =~ ((\/[a-zA-Z0-9\/]+)+) ]] && dr="${BASH_REMATCH[1]}"

            # echo $dr
            # local desttemp="$odest/$dr"
            # echo "Starting from $fixed to $dr with main original $odest layer $layer"
            # local desttemp=$odest${dr#?}
            # echo "Starting $dest ${dr#?} $desttemp on layer $layer"
            move_directory $fixed $dr $osrc $odest $layer
        fi
    done

}

# if [ "$#" -lt 2 ]; then
#     echo "src and dest dirs missing"
#     exit
# fi

move_directory $1 $2 $1 $2 1

# echo "$2/asdfv3/324/3rse4dr/" | sed 's/(\/[a-zA-Z0-9\/]+)+/\1/'
# [[ "$2/asdfv3/324/3rse4dr/" =~ ((\/[a-zA-Z0-9\/]+)+) ]] && echo "${BASH_REMATCH[1]}"

string="project/a/b/c/d"
prefix="project"
suffix="ld"
foo=${d#"$src/"}
foo=${foo%"$suffix"}
# echo "${foo}"