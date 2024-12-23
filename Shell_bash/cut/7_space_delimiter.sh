#!/bin/bash

while IFS= read -r line; do
    echo "$line" | cut -d " " -f 4
done