#!/bin/bash

# Instalación de pip si no está instalado
if ! command -v pip &> /dev/null; then
    sudo apt install -y python-pip
fi

python_tools=(
    scipy
    numpy
    matplotlib
    pyaudio
    libportaudio2
    libportaudiocpp0
)

# Buscar el equivalente de los iguientes paquetes de fedora en debian
# control
# sounddevice
# jupyter
# portaudio-devel
# libportaudio2
# libportaudiocpp0

failed_tools=()

# instalar cada herramienta

for tool in "${python_tools[@]}"; do
    if sudo apt install -y "python3-${tool}"; then
        echo "Tool '$tool' instalada con éxito. "
    else 
        echo "Error al instalar la herramienta '$tool'"
        failed_tools+=("$tool")
    fi
done


if [ ${#failed_tools[@]} -eq 0 ]; then
    echo "Todas las herramientas han sido instaladas exitosamente."
else
    echo "Hubo errores al instalar las siguientes herramientas:"
    for failed_tool in "${failed_tools[@]}"; do
        echo "- $failed_tool"
    done
fi
