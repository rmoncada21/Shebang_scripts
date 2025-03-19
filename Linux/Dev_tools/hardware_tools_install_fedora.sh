#!/bin/bash

# Verificar si dnf está disponible
if ! command -v dnf &> /dev/null; then
    echo "dnf no está disponible. Este script está diseñado para sistemas Fedora."
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
    "tcl-devel"
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
