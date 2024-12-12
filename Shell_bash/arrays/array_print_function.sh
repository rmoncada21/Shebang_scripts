#!/bin/bash

# Declaración de arreglos
iarreglo=(1 2 3 4 5 6 7 8 9)            # Arreglo de enteros
sarreglo=(Hola nuevo mundo desde bash)  # Arreglo de cadenas

# Función para imprimir un arreglo de acuerdo a una opción
function _echo_array(){
    local opcion="$1"  # Argumento que indica cómo imprimir

    if [ "$1" -eq 1 ]; then
        echo "v1: ${sarreglo[@]}"  # Cada elemento separado por espacios
    else
        echo "v2: ${sarreglo[*]}"  # Todo el arreglo como una cadena
    fi
}

# Llamadas de ejemplo para la función _echo_array
# _echo_array 1
# _echo_array 2

# Función para imprimir cada elemento de sarreglo en líneas separadas
function _arreglo_print(){
    for item in "${sarreglo[@]}"; do
        echo $item  # Imprime cada elemento en una línea
    done
}

# Función para imprimir cada elemento de iarreglo usando un índice
function _arreglo_print2(){
    for ((i=0; i<${#iarreglo[@]}; i++)); do
        echo "${iarreglo[$i]}"  # Accede a cada elemento por su índice
    done
}

# Función para imprimir un arreglo recibido como argumentos
function _arreglo_print3(){
    local array="$@"  # Captura todos los argumentos pasados a la función

    for item in "${array[@]}"; do
        echo "$item"  # Imprime cada elemento
    done
}

# Ejemplo: Pasar iarreglo como argumentos a _arreglo_print3
# _arreglo_print3 "${iarreglo[@]}"

# Función para imprimir un arreglo pasado por referencia
function _arreglo_print4(){
    local -n array="$1"  # Uso de referencia indirecta para apuntar al arreglo

    for item in "${array[@]}"; do
        echo "$item"  # Imprime cada elemento del arreglo referenciado
    done
}

# Ejemplo: Pasar iarreglo por referencia a _arreglo_print4
# _arreglo_print4 iarreglo

# Función para reconstruir un arreglo desde una cadena y luego imprimirlo
function _arreglo_print_string() {
    local array_str="$1"          # Recibe una cadena como argumento
    local array=($array_str)      # Convierte la cadena en un arreglo

    for item in "${array[@]}"; do
        echo "$item"  # Imprime cada elemento del arreglo reconstruido
    done
}

echo "funcion _arreglo_print "
_arreglo_print 

echo "funcion _arreglo_print2 "
_arreglo_print2

echo "funcion _arreglo_print3 "
_arreglo_print3 "${sarreglo[@]}"

echo "funcion _arreglo_print4 "
_arreglo_print4 sarreglo

# Llamada a _arreglo_print_string pasando iarreglo como cadena
echo "funcion _arreglo_print_string "
_arreglo_print_string "${iarreglo[*]}"  # Convierte iarreglo a cadena para pasarlo
