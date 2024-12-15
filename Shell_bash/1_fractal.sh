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

    # for (( item="${#local_arreglo_aso[@]}"; item>=0; item++)); do
    #     echo "${local_arreglo_aso[$item]}"
    # done
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
    contador=1;

    while (( contador < local_filas )); do
        # echo "$contador"
        contador=$(echo "$contador*2" | bc)
        arreglo_contador+=($contador)
    done

    # echo " contador = $contador"
}

_count_tree filas
echo "${arreglo_contador[@]}"


function _draw_vertical_ones(){
    local -n local_arreglo_aso1="$1"
    local -n local_arreglo_count="$2"
    # echo "${local_arreglo_count[0]}"
    # index_izq=49
    # indez_der=51
    
    # for para hacer/ver la cantidad de árboles
    for (( a="${#local_arreglo_count[@]} - 2"; a>=0 ; a-- )); do
        echo "valor de la letra a= $a"
        
        # ver la altura del arbol
        altura_arbol=(${local_arreglo_count[$a]})
        echo "altura: $altura_arbol"

        # ver los limites de dibujo
        limite_superior=(${local_arreglo_count[$a+1]})
        echo "limite superior: $limite_superior"
        limite_inferior=$(( local_arreglo_count[a+1] - $altura_arbol ))
        echo "limite inferior: $limite_inferior"
        limite_medio=$(( limite_superior - (altura_arbol / 2) - 1 ))
        echo "limite medio: $limite_medio"

        # local_arreglo_temp1=(${local_arreglo_aso1[$a]})
        n=0;
        for (( b=$filas -1 ; b>=0; b-- )); do     
            local_arreglo_temp1=(${local_arreglo_aso1[$b]})

            # dibujar unos verticales
            if (( $b >= $limite_medio && $b < $limite_superior )); then
                echo "valor de la letra b: $b"
                local_arreglo_temp1[49]="1"
                local_arreglo_aso1[$b]="${local_arreglo_temp1[@]}"

            # dibujar unos horizontales
            elif (( $b < $limite_medio && $b > $limite_inferior)); then
                echo "valor de la letra b elif: $b"
                index_izq=$(( b + 3 ))
                (( index_izq-- ))
                echo "index_izq: $index_izq"
                local_arreglo_temp1[$index_izq]="1"
                local_arreglo_aso1[$b]="${local_arreglo_temp1[@]}"

                index_der=$(( b + 2*n + 3))
                (( index_der++ ))
                (( n++ ))
                echo "index_der: $index_der"
                local_arreglo_temp1[$index_der]="1"
                local_arreglo_aso1[$b]="${local_arreglo_temp1[@]}"
            fi
        done
    
    done
}

function _draw_horizontal_ones(){
    local -n local_arreglo_aso2="$1"   
    local -n local_arreglo_count2="$2"

    for ((c="${#local_arreglo_count2}"; c>=0; c-- )); do
        echo
    done
}

llenar_arreglo arreglo
llenar_arreglo_asociativo asociativo arreglo
# _count_tree filas
# echo "${arreglo_contador[@]}"

_draw_vertical_ones asociativo arreglo_contador
# echo "${asociativo[63]}"
# print_arreglo_asociativo asociativo
remove_whitespace asociativo