#!/bin/bash
#
# Marc DiFilippo - 111420881
# marc.difilippo@stonybrook.edu
#

if [ "$#" -ne 2 ]; then
    echo "data file or output file not found"
    exit
fi

input=$1
output=$2

if [[ ! -f "$input" ]]; then
    echo "$input not found"
    exit 0
fi

touch $output
> $output

columnTotals=()

while IFS= read -r line || [ -n "$line" ]; do
    if [[ $line == *","* ]] || [[ $line == *":"* ]] || [[ $line == *";"* ]]; then
        rows=$(($rows+1))
        array=($(echo "$line" | grep -o  '\(\d\+\)'))
        lcols=${#array[@]}
        if [[ $lcols -ge $cols ]]; then
            cols=$(($lcols))
        fi
        c=0
        for i in "${array[@]}"
        do
            columnTotals[$c]=$((${columnTotals[$c]}+$i))
            c=$(($c+1))
        done
    fi
done < $input

i=1
for v in "${columnTotals[@]}"
do
    echo "Col $i : $v" >> $output
    i=$(($i+1))
done
