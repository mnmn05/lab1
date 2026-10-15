#!/bin/bash
echo "=== for 문 ==="
for ((i=2; i<=9; i++)); do
    echo "[$i단]"
    for ((j=1; j<=9; j++)); do
        echo "$i x $j = $((i*j))"
    done
done
echo "=== while 문 (3단) ==="
j=1
while [ $j -le 9 ]; do
    echo "3 x $j = $((3*j))"
    j=$((j+1))
done
echo "=== until 문 (5단) ==="
j=1
until [ $j -gt 9 ]; do
    echo "5 x $j = $((5*j))"
    j=$((j+1))
done
