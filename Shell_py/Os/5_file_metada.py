#!/usr/bin/env python3

import os
import argparse
import datetime

# obtener la ruta
parser = argparse.ArgumentParser(description="Get File's metada")
parser.add_argument("PATH", help="Insertar dirección del archivo")
args = parser.parse_args()
path = args.PATH

# verificar si la dirección existe
if not os.path.exists(path):
    raise IsADirectoryError(f"NO existe el directorio: $ {path}")
else:
    print(f"PATH: ${path}")

# obtener lista con archivos del directorio
lista = os.listdir(path)
lista_archivos = [file for file in lista if os.path.isfile(os.path.join(path, file))]
print(f"Archivos: ${lista_archivos}")

# obtener metadatos del archivo
for file in lista_archivos:
    metadata = os.stat(file)
    
    print(f"Archivo: ${file}" 
          f"- Modo de archivo: {metadata.st_mode}"
          f"- Size: {metadata.st_size} bytes"
          f"- Ultimo acceso: {datetime.datetime.fromtimestamp(metadata.st_atime)}" 
          f"- Ultima mod: {datetime.datetime.fromtimestamp(metadata.st_mtime)}" )
    