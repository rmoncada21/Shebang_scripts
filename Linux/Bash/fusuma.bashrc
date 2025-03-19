# Iniciar Fusuma al abrir la terminal
# if [ -x "$(command -v fusuma)" ]; then
#     fusuma && clear &
# fi

if [ -x "$(command -v fusuma)" ]; then
    fusuma > /dev/null 2>&1 &
fi

# - fusuma > /dev/null redirige la salida estándar 
#   (los mensajes de información de Fusuma) a null (es decir, los descarta).

# - 2>&1 redirige los errores estándar a la misma ubicación que la salida 
#   estándar (también a null).

# - & asegura que Fusuma se ejecute en segundo plano, lo que no bloqueará 
#   el inicio de la terminal.