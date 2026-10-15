#!/bin/bash
for ((i=5; i>=1; i--)); do
    line=""
    for ((j=0; j<i; j++)); do
        line="$line*"
    done
    echo "$line"
done
