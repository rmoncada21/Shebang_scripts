#!/bin/bash

# Instalación de pip si no está instalado
if ! command -v pip &> /dev/null; then
    sudo dnf install -y python3-pip
fi

python_tools=(
    scipy
    numpy
    matplotlib
    control
    sounddevice
    jupyter
    portaudio
    portaudio-devel
)


failed_tools=()

# instalar cada herramienta

for tool in "${python_tools[@]}"; do
    if pip install "$tool"; then
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
