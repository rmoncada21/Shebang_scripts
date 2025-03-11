#!/bin/bash

# Verificar si dnf está disponible
if ! command -v dnf &> /dev/null; then
    echo "dnf no está disponible. Este script está diseñado para sistemas Fedora."
    exit 1
fi

# Paquetes a instalar con sudo dnf install y pip3
packages=(
    "Development Tools"
    "python3-pip"
    "icdiff"
    "make"
    "automake"
    "gcc"
    "gcc-c++"
    "kernel-devel"
    "clang"
    "valgrind"
    "meld"
    "colordiff"
    "cpplint"
)

failed_packages=()

# Función para instalar paquetes
function instalar_paquete() {
    local paquete=$1
    if sudo dnf install -y "$paquete"; then
        echo "Paquete '$paquete' instalado con éxito."
    else
        echo "Error al instalar el paquete '$paquete'."
        failed_packages+=("$paquete")
    fi
}

# Instalar cada paquete
for package in "${packages[@]}"; do
    if [ "$package" == "Development Tools" ]; then
        if sudo dnf groupinstall -y "$package"; then
            echo "Grupo de paquetes '$package' instalado con éxito."
        else
            echo "Error al instalar el grupo de paquetes '$package'."
            failed_packages+=("$package")
        fi
    elif [ "$package" == "icdiff" ] || [ "$package" == "cpplint" ]; then
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
