#!/bin/bash

while IFS= read -r line; do
    echo "$line" | cut -c 1-4
done