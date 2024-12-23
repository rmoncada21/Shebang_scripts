#!/bin/bash
N=5

filas=63
columnas=100

asociativo_32=()
asociativo_16=()
asociativo_8=()
asociativo_4=()
asociativo_2=()
arreglo_1=()
arreglo_underscore=()
where_unos=()

# Funcion para llenar arreglos 
function llenar_arreglo_underscore(){
    local -n local_arreglo="$1"

    for ((i=0; i<$columnas; i++)); do
        local_arreglo[$i]="_"
    done
}

# Función para llenar el arreglo asociativo
function llenar_arreglo_asociativo(){
    local -n local_arreglo_aso="$1"
    local -n local_arreglo="$2"
    local    local_filas="$3"

    for ((i=0; i<$local_filas; i++)); do
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

function remove_whitespace(){
    local -n local_arreglo_aso="$1"

    for item in "${!local_arreglo_aso[@]}"; do
        # acceder al arreglo temporal
        nueva_linea=$(echo "${local_arreglo_aso[$item]}" | sed 's/ //g')
        echo "$nueva_linea"
    done
}

function get_unos(){
    local -n local_get_unos="$1"
    # inicilizar arreglo en nulo
    where_unos=()

    for (( i=0; i<"${#local_get_unos[@]}"; i++)); do
        if [ "${local_get_unos[$i]}" == "1" ]; then
            where_unos+=("$i")
        fi
    done
}

function count_filas(){
    # echo "count_filas"
    local -n local_arreglo_count="$1"

    for item in "${!local_arreglo_count[@]}"; do
        echo "$item"
    done
}

function _draw_vertical_ones(){
    echo "draw_vertical_ones"
    
    # arreglos locales
    local -n local_arreglo_aso1="$1"
    local -n local_arreglo_index1="$2"

    # obtener el numero de filas del arreglo
    numero_filas_string=$(echo $(count_filas local_arreglo_aso1))
    # convertir numero de filas de string a entero
    arreglo_numero_filas_entero=( ${numero_filas_string[@]} )
    # obtener el tamaño del arreglo
    altura_arreglo_size=${#arreglo_numero_filas_entero[@]}

    # limites
    local_limite_superior=$(( ${#arreglo_numero_filas_entero[@]} - 1 ))
    echo "local_limite_superior: $local_limite_superior"
    local_limite_medio=$(( local_limite_superior / 2 ))
    echo "local_limite_medio: $local_limite_superior"
    local_limite_inferior=0
    echo "local_limite_inferior: $local_limite_inferior"

    # bucle para dibujar la cantidad de lineas
    for (( a=0; a<${#local_arreglo_index1[@]}; a++ )); do
        # echo "numero de indices: ${#local_arreglo_index1[@]}"
        local_indice=${local_arreglo_index1[$a]}

        # bucle para dibujar lineas verticales
        for (( i=altura_arreglo_size-1; i>=0; i-- )); do
            # obtener el arreglo dentro del arreglo
            local_arreglo_temp=(${local_arreglo_aso1[$i]})
            # echo "${local_arreglo_temp[@]}"

            if (( $i <= $local_limite_superior && $i > $local_limite_medio )); then
                local_arreglo_temp[local_indice]="1"
                local_arreglo_aso1[$i]="${local_arreglo_temp[@]}"
            fi
        done
    done

}

function _draw_horizontal_ones(){
    echo
}

function _draw_ones(){
    echo "draw_ones"
    # arreglos locales
    local -n local_arreglo_aso="$1"
    local -n local_arreglo_index="$2"

    # ver los limites de dibujo
    limite_superior=$(( ${local_}))
    limite_medio=
    limite_inferior="0"

    _draw_vertical_ones local_arreglo_aso local_arreglo_index
}

# ubicación del primer indice
where_unos_inicio=(49)

llenar_arreglo_underscore arreglo_underscore
llenar_arreglo_asociativo asociativo_32 arreglo_underscore 32
# print_arreglo_asociativo asociativo_32
# remove_whitespace asociativo_32

# test_arreglo=(_ _ _ _ 1 1 1 _ 1 _)
get_unos test_arreglo
# echo "${#test_arreglo[@]}"
# echo "${where_unos[@]}"

# _draw_vertical_ones asociativo_32 where_unos_inicio
_draw_ones asociativo_32 where_unos_inicio
# print_arreglo_asociativo asociativo_32 
remove_whitespace asociativo_32