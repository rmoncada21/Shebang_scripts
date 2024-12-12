declare -A matriz

readonly filas=4
readonly columnas=4

# Llenar la matriz
for ((i=0; i<"$filas"; i++)); do
    for ((j=0; j<"$columnas"; j++)); do
        echo "$i - $j"
        matriz["$i,$j"]="0 1 2 3 4 5 6 7 8 9"
    done
done

# Cambiar los elementos de la posición
matriz["0,2"]=" - - - - - - - - - - - "


# Imprimir los resultados de la matriz

# De esta forma, no se obtiene los indices de salida de forma
# "ordenada" (ver salida)
for item in "${!matriz[@]}"; do
    echo "$item"
done

# salida
# 0,3
# 0,2
# 0,1
# 0,0
# 2,1
# 2,0
# 2,3
# 2,2
# 1,2
# 1,3
# 1,0
# 1,1
# 3,0
# 3,1
# 3,2
# 3,3

# Imprimir los resultados de la matriz
echo

for item in "${matriz[@]}"; do
    echo "$item"
done

# salida 
# 0 1 2 3 4 5 6 7 8 9
#  - - - - - - - - - - -
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9

# Imprimir los resultados de la matriz
echo -e " \n otra forma \n"

for ((i=0; i<"$filas"; i++)); do
    for ((j=0; j<"$columnas"; j++)); do
        # echo "$m[$i, $j]"
        echo "${matriz["$i,$j"]}"
    done
done

# salida
#  otra forma
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
#  - - - - - - - - - - -
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9
# 0 1 2 3 4 5 6 7 8 9