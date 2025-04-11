#!/usr/bin/env python3

import os
import argparse

# Obtener PATH

parser = argparse.ArgumentParser(description="Analizar permisos de directorio")
parser.add_argument("PATH", help="insertar PATH del directorio ")
args = parser.parse_args()
path = args.PATH

# Verificar si existe el directorio
if not os.path.exists(path):
    raise IsADirectoryError(f"NO existe el directorio: $ {path}")
else:
    print(f"PATH: ${path}")

# Check readability, writability and executability of the specified path
# Permisos básicos
print("Lectura:", os.access(path, os.R_OK))     # ¿Se puede leer?
print("Escritura:", os.access(path, os.W_OK))   # ¿Se puede escribir?
print("Ejecución:", os.access(path, os.X_OK))   # ¿Se puede ejecutar?