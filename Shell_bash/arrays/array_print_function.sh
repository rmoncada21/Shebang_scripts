#!/bin/bash

# forma 1
iarreglo=(1 2 3 4 5 6 7 8 9)
sarreglo=(Hola nuevo mundo desde bash)


function _echo_array(){
    local opcion="$1"

    if [ "$1" -eq 1 ]; then
        echo "v1: ${sarreglo[@]}"
    else
        echo "v2: ${sarreglo[*]}"
    fi
}

# _echo_array 1
# _echo_array 2
function _arreglo_print(){
    for item in "${sarreglo[@]}"; do
        echo $item
    done
}

function _arreglo_print2(){
    for ((i=0; i<${#iarreglo[@]}; i++)); do
        echo "${iarreglo[$i]}"
    done
}

function _arreglo_print3(){
    local array="$@"

    for item in "${array[@]}"; do
        echo "$item"
    done
}

# _arreglo_print3 "${iarreglo[@]}"

function _arreglo_print4(){
    local -n array="$1"

    for item in "${array[@]}"; do
        echo "$item"
    done
}

# _arreglo_print4 iarreglo

function _arreglo_print_string() {
    local array_str="$1"
    local array=($array_str)  # Convierte la cadena de vuelta a un arreglo

    for item in "${array[@]}"; do
        echo "$item"
    done
}

_arreglo_print_string "${iarreglo[*]}"  # Pasar como una cadena separada por espacios
