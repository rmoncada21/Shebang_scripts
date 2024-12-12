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
  local fila="$1"
  local columna="$2"
  echo "${matriz["$fila,$columna"]}"
}

# Convertir la entrada matriz["0,0"] en un arreglo
arreglo=(${matriz["0,0"]})

# Ejemplo: obtener el elemento en la posición (0,0)
echo "Elemento en (0,0): $(acceder_matriz 0 0)"  # Esto devuelve 6
echo "${arreglo[5]}"

echo "------------------------------------------------"