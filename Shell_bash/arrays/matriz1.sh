# Declarar un arreglo asociativo
declare -A matriz
# Asignar valores
matriz["0,0"]="1 2 3 4 5 6 7 8 9"
matriz["0,1"]=2
matriz["0,2"]=3
matriz["1,0"]=4
matriz["1,1"]=5
matriz["1,2"]=6
matriz["2,0"]=7
matriz["2,1"]=8
matriz["2,2"]=9

# Función para acceder a elementos
acceder_matriz() {
  local fila=$1
  local columna=$2
  echo "${matriz["$fila,$columna"]}"
}

# Convertir la entrada matriz["0,0"] en un arreglo
arreglo=(${matriz["0,0"]})

# Ejemplo: obtener el elemento en la posición (1,2)
echo "Elemento en (0,0): $(acceder_matriz 0 0)"  # Esto devuelve 6
echo "${arreglo[5]}"

echo "------------------------------------------------"

declare -A matriz2

readonly filas=4
readonly columnas=4

# Llenar la matriz2
for ((i=0; i<"$filas"; i++)); do
    for ((j=0; j<"$columnas"; j++)); do
        echo "$i - $j"
        matriz2["$i,$j"]="0 1 2 3 4 5 6 7 8 9"
    done
done

# Cambiar los elementos de la posición
matriz2["0,2"]=" - - - - - - - - - - - "

# Imprimir los resultados de la matriz2

# De esta forma, no se obtiene los indices de salida de forma
# "ordenada" (ver salida)
for item in "${!matriz2[@]}"; do
    echo "$item"
done

for item in "${matriz2[@]}"; do
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

echo -e " \n otra forma \n"

# Imprimir los resultados de la matriz2
for ((i=0; i<"$filas"; i++)); do
    for ((j=0; j<"$columnas"; j++)); do
        # echo "$m[$i, $j]"
        echo "${matriz2["$i,$j"]}"
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
