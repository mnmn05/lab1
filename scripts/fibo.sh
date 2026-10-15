#!/bin/bash
n=${1:-10}
a=0
b=1
echo -n "피보나치 수열($n항): "
for ((i=0; i<n; i++)); do
    echo -n "$a "
    let next=a+b
    a=$b
    b=$next
done
echo
