arreglo1=(1 2 3 4 5 6 7 8 9)
arreglo2=(10 11 12 13 14 15 16 17 18 19)

arreglo+=([1]="${arreglo1[@]}")
arreglo+=([2]="${arreglo2[@]}")

for ((i=1; i<="${#arreglo[@]}"; i++)); do
    echo "${arreglo[$i]}"
done

# salida
# 1 2 3 4 5 6 7 8 9
# 10 11 12 13 14 15 16 17 18 19

echo 

for item in "${arreglo[@]}"; do
    echo "${item}"
done

# salida
# 1 2 3 4 5 6 7 8 9
# 10 11 12 13 14 15 16 17 18 19

echo

echo "extrayendo arreglo asociativo (arreglo dentro del arreglo)"
for item in "${!arreglo[@]}"; do
    temp_arreglo=(${arreglo[$item]})
    echo "${temp_arreglo[@]}"
    # extrayendo una posición especifica
    echo "Posición ${temp_arreglo[5]}"
done

# salida
# extrayendo arreglo asociativo (arreglo dentro del arreglo)
# 1 2 3 4 5 6 7 8 9
# Posición 2
# 10 11 12 13 14 15 16 17 18 19
# Posición 12
