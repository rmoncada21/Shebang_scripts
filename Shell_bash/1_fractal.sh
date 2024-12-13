#!/bin/bash

filas=63
columnas=100

# Usando arreglos asociativos
arreglo=()
asociativo=()

# Funcion para llenar arreglos 
function llenar_arreglo(){
    # pasar arreglo por referencia para poder modificarlo
    local -n local_arreglo="$1"

    for ((i=0; i<$columnas; i++)); do
        local_arreglo[$i]="_"
    done
}

# Imprimir "arreglo"
echo "Imprimir arreglo"
llenar_arreglo arreglo
echo "${arreglo[*]}"

# Función para llenar el arreglo asociativo
function llenar_arreglo_asociativo(){
    local -n local_arreglo_aso="$1"
    local -n local_arreglo="$2"

    for ((i=0; i<$filas; i++)); do
        local_arreglo_aso+=([$i]="${local_arreglo[@]}")
    done        
}

# Función para imprimir el arreglo asocitivo
function print_arreglo_asociativo(){
    local -n local_arreglo_aso="$1"

    for item in "${local_arreglo_aso[@]}"; do
        echo "$item"
    done
}

# Imprimir "arreglo_asociativo"
echo "Sección de arreglos asociativos"
llenar_arreglo_asociativo asociativo arreglo
echo
print_arreglo_asociativo asociativo


# Función para quitar los espacios en blanco dentro de los arreglos
function remove_whitespace(){
    local -n local_arreglo_aso="$1"

    for item in "${!local_arreglo_aso[@]}"; do
        # acceder al arreglo temporal
        nueva_linea=$(echo "${local_arreglo_aso[$item]}" | sed 's/ //g')
        # echo "$nueva_linea"
    done
}

remove_whitespace asociativo
print_arreglo_asociativo asociatio

# TODO: implement function logic to make a tree pattern
function tree_pattern(){
    local -n local_arreglo_aso="$1"
}

