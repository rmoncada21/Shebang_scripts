#!/bin/bash

# Listas de extensiones a instalar categorizadas por tipo
extensions=(
    "GitHub.github-vscode-theme" # tema para vscode
    "ms-vscode.cpptools"    # extensiones para c_cpp_tools
    "ms-toolsai.jupyter"    # extensiones para
    "ms-toolsai.jupyter-keymap"
    "ms-toolsai.jupyter-renderers"
    "ms-toolsai.vscode-jupyter-slideshow"
    "shd101wyy.markdown-preview-enhanced" # extensiones para markdown
    "yzane.markdown-pdf"
    "ms-python.python"  # extensiones para python
    "ms-python.vscode-pylance"
    "mshr-h.veriloghdl" # extensiones para hardware
    "wavetrace.wavetrace"
    "xuanli.spice"
    "leafvmaple.octave" # extensiones para octave
)

# Lista de extensiones que fallaron
failed_extensions=()

# Función para instalar una extensión
install_extension() {
    local extension=$1
    if code --install-extension "$extension"; then
        echo "Extensión '$extension' instalada con éxito."
    else
        echo "Error al instalar la extensión '$extension'."
        failed_extensions+=("$extension")
    fi
}

# Instalar todas las extensiones
for extension in "${extensions[@]}"; do
    install_extension "$extension"
done

# Verificar si hubo fallos
if [ ${#failed_extensions[@]} -eq 0 ]; then
    echo "Todas las extensiones han sido instaladas exitosamente."
else
    echo "Hubo errores al instalar las siguientes extensiones:"
    for failed_extension in "${failed_extensions[@]}"; do
        echo "- $failed_extension"
    done
fi
