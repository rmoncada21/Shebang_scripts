#!/bin/bash

texto="$1"

while IFS= read -r linea; do
    echo -n "$linea" | cut -c 3
done <<< "$texto"

# Funciona en hackerrank
# while IFS= read -r linea; do
#     echo "$linea" | cut -c 3
# done