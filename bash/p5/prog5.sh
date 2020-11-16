#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "input file and dictionary missing"
    exit 0
fi

input=$1
dictionaryFile=$2

if [[ ! -f "$input" ]]; then
    echo "$input is not a file"
    exit 0
fi

if [[ ! -f "$dictionaryFile" ]]; then
    echo "$dictionaryFile is not a file"
    exit 0
fi

dictionary=()
i=0
while IFS= read -r line || [ -n "$line" ]; do
    dictionary[$i]=$line
    i=$(($i+1))
done < $dictionaryFile

# echo "Finished loading dictionary!"

i=0
while IFS='' read -r line || [ -n "$line" ]; do
    i=$(($i+1))
    words=()
    IFS=', ' read -r -a words <<< "$line"
    for w in "${words[@]}"
    do
        justword="${w//[^[:alnum:]]/}"
        size=${#justword}
        if [ $size -eq 4 ]; then
            index=0
            exists=0
            for word in "${dictionary[@]}"
            do
                if [ $justword = $word ]; then
                    exists=1
                    break
                fi
            done
            if [ $exists -ne 1 ]; then
                echo $justword
            fi
        fi
    done
done < $input
