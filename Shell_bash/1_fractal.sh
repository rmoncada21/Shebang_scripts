#!/bin/bash
# N=5
# filas=$(((2**N) - 1))
# echo "filas=$filas"
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
# echo "Imprimir arreglo"
# llenar_arreglo arreglo
# echo "${arreglo[*]}"

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
# echo "Sección de arreglos asociativos"
# llenar_arreglo_asociativo asociativo arreglo
# echo
# print_arreglo_asociativo asociativo


# Función para quitar los espacios en blanco dentro de los arreglos
function remove_whitespace(){
    local -n local_arreglo_aso="$1"

    for item in "${!local_arreglo_aso[@]}"; do
        # acceder al arreglo temporal
        nueva_linea=$(echo "${local_arreglo_aso[$item]}" | sed 's/ //g')
        echo "$nueva_linea"
    done
}

# remove_whitespace asociativo
# print_arreglo_asociativo asociatio

# TODO: implement function logic to make a tree pattern
function tree_pattern(){
    local -n local_arreglo_aso="$1"
}

function _count_tree(){
    local -n local_filas="$1"
    contador=2;

    while (( contador < local_filas )); do
        # echo "$contador"
        arreglo_contador+=($contador)
        contador=$(echo "$contador*2" | bc)
    done

    # echo " contador = $contador"
}

# _count_tree filas
# echo "${arreglo_contador[@]}"


function _draw_vertical_ones(){
    local -n local_arreglo_aso1="$1"
    local -n local_arreglo_count="$2"

    # for para hacer/ver la cantidad de árboles
    for (( j="${#local_arreglo_count[@]} - 1"; j>=0; j--)); do
        # echo "$j"
        altura_arbol=${local_arreglo_count[$j]}
        suma_arbol=$(($suma_arbol + ${local_arreglo_count[$j]}))
        
        nuevo_limite=$suma_arbol

        echo $suma_arbol

        # for para recorrer el arreglo asociativo
        for (( k="$filas-1"; k>=0; k-- )); do
            local_arreglo_temp1=(${local_arreglo_aso1[$k]})
            # local_arreglo_temp1[49]="1"
            # local_arreglo_aso1[$k]="${local_arreglo_temp1[@]}"

            if (( k >= ( filas - suma_arbol ) )); then
                local_arreglo_temp1[49]="1"
                local_arreglo_aso1[$k]="${local_arreglo_temp1[@]}"
                # echo -n
            fi

            # nueva_altura=(($filas))
        done

    done
}

function _draw_horizontal_ones(){
    echo
}

llenar_arreglo arreglo
llenar_arreglo_asociativo asociativo arreglo
_count_tree filas
# echo "${arreglo_contador[@]}"

_draw_vertical_ones asociativo arreglo_contador
# echo "${asociativo[63]}"
# print_arreglo_asociativo asociativo
remove_whitespace asociativo