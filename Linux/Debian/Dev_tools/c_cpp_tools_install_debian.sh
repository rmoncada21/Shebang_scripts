#!/bin/bash

# Verificar si apt está disponible
if ! command -v apt &> /dev/null; then
    echo "apt no está disponible. Este script está diseñado para sistemas Debian o derivados."
    exit 1
fi

# Paquetes a instalar con sudo apt install y pip3
packages=(
    "build-essential"  # Correspondiente a Development Tools en Fedora
    "python3-pip"
    "icdiff"
    "make"
    "automake"
    "gcc"
    "g++"  # En Debian, el paquete gcc-c++ se llama g++
    "linux-headers-$(uname -r)"  # Similar a kernel-devel en Fedora
    "clang"
    "valgrind"
    "meld"
    "colordiff"
    "cpplint"
)

# Buscar el equivalente de los iguientes paquetes de fedora en debian 
# Hubo errores al instalar las siguientes herramientas:
# - icdiff
# - linux-headers-5.15.167.4-microsoft-standard-WSL2
# - cpplint

failed_packages=()

# Función para instalar paquetes
function instalar_paquete() {
    local paquete=$1
    if sudo apt install -y "$paquete"; then
        echo "Paquete '$paquete' instalado con éxito."
    else
        echo "Error al instalar el paquete '$paquete'."
        failed_packages+=("$paquete")
    fi
}

# Actualizar la lista de paquetes antes de empezar
sudo apt update

# Instalar cada paquete
for package in "${packages[@]}"; do
    if [ "$package" == "build-essential" ]; then
        # El grupo de desarrollo en Fedora es equivalente a 'build-essential' en Debian
        if sudo apt install -y "$package"; then
            echo "Paquete '$package' instalado con éxito."
        else
            echo "Error al instalar el paquete '$package'."
            failed_packages+=("$package")
        fi
    elif [ "$package" == "icdiff" ] || [ "$package" == "cpplint" ]; then
        # Paquetes que se instalan con pip3
        if pip3 install "$package"; then
            echo "Paquete '$package' instalado con éxito."
        else
            echo "Error al instalar el paquete '$package' con pip3."
            failed_packages+=("$package")
        fi
    else
        instalar_paquete "$package"
    fi
done

# Mostrar resumen de la instalación
if [ ${#failed_packages[@]} -eq 0 ]; then
    echo "Todas las herramientas han sido instaladas exitosamente."
else
    echo "Hubo errores al instalar las siguientes herramientas:"
    for failed_package in "${failed_packages[@]}"; do
        echo "- $failed_package"
    done
fi