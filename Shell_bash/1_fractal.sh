#!/bin/bash

filas=()

for ((i=0; i<5; i++)); do
    filas[$i]="$i"
done

# echo "${filas[@]}"

matriz=()

for ((j=0; j<10; j++)); do
    matriz[$j]=${filas[*]}
done

# echo "${matriz[@]}"

function print_array_v1(){
    local array=$1

    for ((i=0; i<${#array[@]}; i++)); do
        echo "${array[$i]}"
    done
}

function print_array_v2(){
    local -n array=$1

    for item in "${array[@]}"; do
        echo "$item"
done
}

function print_array_v3(){
    local -n array="$1"

    for item in "${array[@]}"; do
        echo "$item"
done
}

# print_array_v2 "${filas[*]}"


print_array_v3 matriz