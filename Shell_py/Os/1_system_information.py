#!/usr/bin/env python3

import os
import platform

# Obtener información del sistema operativo
informacion_sistema_os = os.uname()
informacion_sistema_plat = platform.uname()

print(f"Información del sistema: $ {informacion_sistema_plat}")
print(f"Sistema operativo: $ {informacion_sistema_os.sysname}")
print(f"Nombre del dispositivo: $ {informacion_sistema_os.nodename}")
print(f"Versión de la plataforma $ {informacion_sistema_os.release}")
print(f"Arquitectura: $ {informacion_sistema_os.machine}")

# Obtener información del directorio de trabajo
pwd = os.getcwd()
print(f"\nDirectorio de trabajo actual: {pwd}")

if not os.path.exists(pwd):
    raise NotADirectoryError(f"La ruta ${pwd} no existe")

# Obtener archivos y directorios de trabajo
list_documents = os.listdir(pwd)

# Verificar archivos
try:
    for element in list_documents:
        if os.path.isfile(element):
            print(f"Archivo: ${element}")
except FileNotFoundError:
    print("No se encontraron archivos")

# Verificar folders
print("")
try:
    for element in list_documents:
        if os.path.isdir(element):
            print(f"Folder: $ {element}")
except NotADirectoryError:
    print("No se encontraron directorios")