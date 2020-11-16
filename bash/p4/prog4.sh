#!/bin/bash
if [ "$#" -lt 1 ]; then
    echo "score directory missing"
    exit 0
fi

data=$1

if [[ ! -d "$data" ]]; then
    echo "$data is not a directory"
    exit 0
fi

for d in $data/*.txt ; do
    int=-1
    while IFS= read -r line || [ -n "$line" ]; do
        # echo "----------- $int"
        if [[ $int -ne -1 ]]; then
            array=($(echo "$line" | grep -o  '\(\d\+\)'))
            total=0
            q=0
            id=0
            for i in "${array[@]}"
            do
                if [[ $q -ne 0 ]]; then
                    total=$(($total+$i))
                else
                    id=$i
                fi
                q=$(($q+1))
            done
            percentage=$((($total*100)/50))
            letter="D"
            if [[ $percentage -ge 93 ]]; then
                letter="A"
            elif [[ $percentage -ge 80 ]]; then
                letter="B"
            elif [[ $percentage -ge 65 ]]; then
                letter="C"
            fi
            # echo "Student ID: $id, total: $total, percentage: $percentage, letter: $letter"
            echo "$id:$letter"
        fi
        int=$(($int+1))
        # echo "----------- $int"
    done < $d
done
