#!/bin/bash 


while IFS= read -r line; do
    echo "$line" | cut -d $'\t' -f 1-3
done