#!/bin/bash

while IFS= read -r line; do
    echo "$line" | cut -c 2-7
done