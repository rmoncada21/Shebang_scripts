#!/usr/bin/env python3
import os
import argparse

# pasar directorio por agumentos
# la descripción de ArgumentParser se muestra solo cuando ./sccript -h
parser = argparse.ArgumentParser(description="Mostrar archivos y directorios")
parser.add_argument("path", help="Pasar dirección del directorio por argumento")
args = parser.parse_args()
local_path = args.path
list_documents = os.listdir(local_path)
print(f"Lis documents: ${list_documents}")

# formas de manejar los errores
# Opcion 1: mostrando el traceback - mejor para debuggear
if not os.path.exists(local_path):
    raise IsADirectoryError(f"No existe el directorio: $ {local_path}")
else:
    print(f"PATH: ${local_path}")

# Opcion 2: salida limpia sin traceback - para resultados finales
# try:
#     if not os.path.exists(local_path):
#         raise IsADirectoryError(f"No existe el directorio: {local_path}")
# except IsADirectoryError as e:
#     print(e)
#     exit(1)

# Mostrar solo archivos
# list_files = [file for file in list_documents if os.path.isfile(file)]
# list_files = [file for file in list_documents if os.path.isfile(f) and file.endswith(".py")]
list_files = [file for file in list_documents if os.path.isfile(os.path.join(local_path, file))]
# list_files = list(filter(os.path.isfile, list_documents))
print(f"Lista de archivos: $ {list_files}")

# Mostrar solo directorios
# list_directories = list(filter(os.path.isdir, list_documents))
list_directories = [dir for dir in list_documents if os.path.isdir(os.path.join(local_path, dir))]
print(f"Lista de directorios: $ {list_directories}")
