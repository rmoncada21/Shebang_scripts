arreglo1=(1 2 3 4 5 6 7 8 9)
arreglo2=(10 11 12 13 14 15 16 17 18 19)

arreglo+=([1]="${arreglo1[@]}")
arreglo+=([2]="${arreglo2[@]}")

# Imprimir arreglo forma 1
echo "Imprimir arreglo forma 1"
for ((i=1; i<="${#arreglo[@]}"; i++)); do
    echo "${arreglo[$i]}"
done

# salida
# 1 2 3 4 5 6 7 8 9
# 10 11 12 13 14 15 16 17 18 19

# Imprimir arreglo forma 2
echo -e "\nImprimir arreglo forma 2"
for item in "${arreglo[@]}"; do
    echo "${item}"
done

# salida
# 1 2 3 4 5 6 7 8 9
# 10 11 12 13 14 15 16 17 18 19

# Imprimir forma 3; y acceder a  subarreglo
echo -e "\nImprimir arreglo forma 3"
echo "Extrayendo arreglo asociativo (arreglo dentro del arreglo)"
for item in "${!arreglo[@]}"; do
    temp_arreglo=(${arreglo[$item]})
    echo "${temp_arreglo[@]}"
    # extrayendo una posición especifica
    echo "Posición 5: ${temp_arreglo[5]}"
done

# salida
# extrayendo arreglo asociativo (arreglo dentro del arreglo)
# 1 2 3 4 5 6 7 8 9
# Posición 2 (un arreglo en la pos 2 dentro del arreglo)
# 10 11 12 13 14 15 16 17 18 19
# Posición 12
