#!/bin/bash
if [ "$#" -lt 1 ]; then
    echo "missing data file"
    exit 0
fi

data=$1

if [[ ! -f "$data" ]]; then
    echo "missing data file"
    exit 0
fi

weights=()

if [ "$#" -gt 1 ]; then
    first=1
    i=0
    for var in "$@"
    do
        if [ $first = 1 ]; then
            first=0
        else
            weights[$i]=$var
            i=$(($i+1))
        fi
    done
fi

scores=()
int=-1
while IFS= read -r line || [ -n "$line" ]; do
    # echo "----------- $int"
    if [[ $int -ne -1 ]]; then
        array=($(echo "$line" | grep -o  '\(\d\+\)'))
        wavg=0
        q=-1
        weightTotal=0
        for i in "${array[@]}"
        do
            if [[ $q -ne -1 ]]; then
                weight=${weights[$q]}
                numreg='^[0-9]+$'
                if [[ ! $weight =~ $numreg ]]; then
                    weight=1
                fi
                # echo "$weight w"
                mult=$(($i*$weight))
                # echo "$mult m, $i"
                wavg=$(($wavg+$mult))
                weightTotal=$(($weightTotal+$weight))
                # echo "$wavg avg"
            fi
            q=$(($q+1))
        done
        scores[$int]=$(($wavg/$weightTotal))
        # echo "Student avg: $(($wavg/$weightTotal)), wavg: $wavg, weight total: $weightTotal, ${#scores[@]}"
    fi
    int=$(($int+1))
    # echo "----------- $int"
done < $data

total=0
count=0

for i in "${scores[@]}"
do
    # echo $i
    total=$(($total+$i))
    count=$(($count+1))
done

avg=$(($total/$count))

# echo "$total, $count, $avg"

echo $avg
