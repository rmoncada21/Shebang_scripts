#!/bin/bash

while IFS= read -r linea; do
    echo "$linea" | cut -c 2,7
    # echo "$linea"
done