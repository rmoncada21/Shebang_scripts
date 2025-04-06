#!/bin/bash

# Verificar si apt está disponible
if ! command -v apt &> /dev/null; then
    echo "apt no está disponible. Este script está diseñado para sistemas Debian o derivados."
    exit 1
fi

# Paquetes a instalar
packages=(
    "iverilog"
    "gtkwave"
    "verilator"
    "yosys"
    "abc"
    "nextpnr"
    "ngspice"
    "tcl"
    "tcl-dev"  # En Debian, tcl-devel es tcl-dev
)

# Buscar el equivalente de los iguientes paquetes de fedora en debian
# Hubo errores al instalar las siguientes herramientas:
# - abc
# - nextpnr

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
    instalar_paquete "$package"
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