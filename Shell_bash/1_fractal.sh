#!/bin/bash

filas=10
columnas=10

# Usando arreglos asociativos
arreglo=()
asociativo=()

# Funcion para llenar arreglos 
function _llenar_arreglo(){
    # pasar arreglo por referencia para poder modificarlo
    local -n local_arreglo="$1"

    for ((i=0; i<$columnas; i++)); do
        local_arreglo[$i]="-"
    done
}

# Imprimir "arreglo"
_llenar_arreglo arreglo
echo "${arreglo[*]}"

# Función para llenar el arreglo asociativo
function _llenar_arreglo_asociativo(){
    local -n local_arreglo_aso="$1"
    local -n local_arreglo="$2"

    for ((i=0; i<$filas; i++)); do
        local_arreglo_aso+=([$i]="${local_arreglo[@]}")
    done        
}

# Función para imprimir el arreglo asocitivo
function _print_arreglo_asociativo(){
    local -n local_arreglo_aso="$1"

    for item in "${local_arreglo_aso[@]}"; do
        echo "$item"
    done
}

# Imprimir "arreglo_asociativo"
_llenar_arreglo_asociativo asociativo arreglo
echo
_print_arreglo_asociativo asociativo
# echo "${asociativo[@]}"

# TODO: implement function logic to remove whitespaces from string
# Función para quitar los espacios en blanco dentro de los arreglos
function _remove_whitespace(){
    local -n local_arreglo="$1"
}

resultado=$(_remove_whitespace arreglo)