# ~/.bashrc.d/functions.bashrc

############################################### funciones para fedora ###############################################

workspace_computacion(){
        touch ~/.bashrc.d/.bashrc_current_workspace_computacion.txt

        local update_directory="$1"
        local directory=$(cat ~/.bashrc.d/.bashrc_current_workspace_computacion.txt)

        if [ -n "$update_directory" ]; then
                echo $update_directory > ~/.bashrc.d/.bashrc_current_workspace_computacion.txt
        else
                echo -n "pwd: " && cd "$directory" && pwd && echo -e "\n" && ll
        fi
}

workspace_digital(){
        touch ~/.bashrc.d/.bashrc_current_workspace_digital.txt

        local update_directory="$1"
        local directory=$(cat ~/.bashrc.d/.bashrc_current_workspace_digital.txt)

        if [ -n "$update_directory" ]; then
                echo $update_directory > ~/.bashrc.d/.bashrc_current_workspace_digital.txt
        else
                echo -n "pwd: " && cd "$directory" && pwd && echo -e "\n" && ll
        fi
}

############################################## funciones para makefile ##############################################

# alias mcode="make code"
# alias mrun="make run"

mall(){
        local app="$1"
        local test_input="$2"

        if [ -n "$test_input" ]; then
                make all APP="$app" TEST_INPUT="$test_input"
        else 
                make all APP="$app"
        fi
}

mcode() {
        local app="$1"
        local libraries="$2"
    
        if [ -n "$libraries" ]; then
                make code APP="$app" LIBRARIES="$libraries"
        else
                make code APP="$app"
        fi
}

mrun(){
        local app="$1"
        local test_input="$2"

        if [ -n "$test_input" ]; then
                make run APP="$1" TEST_INPUT="$2"
        else
                make run APP="$1" 
        fi
}

mlint(){
        local app="$1"

        make lint APP="$app"
}

############################################## funciones para foxit ##############################################

# función para abrir documentos txt con los libros pdf's
_foxit_open_txt(){
        # echo "entro open"
        local foxit_session="$1"
        echo "var foxit_session= $foxit_session"
        while IFS= read -r linea; do
                _foxit_alias "$linea" &
                sleep 2
        done < "$foxit_session"
}

# Autocompletado para foxit
_foxit_autocomplete() {
    local cur="${COMP_WORDS[COMP_CWORD]}" # Lo que el usuario ha escrito hasta el momento

    # Lista de opciones para el autocomplementado
    local options="'--help' arquitectura sistemas_digitales sistemas_digitales_verilog sistemas_digitales_systemverilog vlsi verificacion_funcional verilog systemverilog comunicaciones_electricas programacion"

    # Generar las posibles sugerencias
    COMPREPLY=( $(compgen -W "${options}" -- "${cur}") )
}

# Registra la función de autocompletado para el comando foxit
complete -F _foxit_autocomplete foxit

foxit() {
    local variable="$1"

    local session_arquitectura="$HOME/.bashrc.d/.foxit_session/.foxit_session_arquitectura.txt"
    local session_sistemas_digitales="$HOME/.bashrc.d/.foxit_session/.foxit_session_sistemas_digitales.txt"
    local session_vlsi="$HOME/.bashrc.d/.foxit_session/.foxit_session_vlsi.txt"
    local session_verificacion_funcional="$HOME/.bashrc.d/.foxit_session/.foxit_session_verificacion_funcional.txt"
    local session_verilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_verilog.txt"
    local session_systemverilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_systemverilog.txt"
    local session_sistemas_digitales_systemverilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_sistemas_digitales_systemverilog.txt"
    local session_sistemas_digitales_verilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_sistemas_digitales_verilog.txt"
    local session_comunicaciones_electricas="$HOME/.bashrc.d/.foxit_session/.foxit_session_comunicaciones_electricas.txt"
    local session_programacion="$HOME/.bashrc.d/.foxit_session/.foxit_session_programacion.txt"

    # Función de ayuda
    _foxit_help() {
        echo "Uso: foxit [opción]"
        echo ""
        echo "Opciones disponibles:"
        echo "  arquitectura                     → Abre la sesión de Arquitectura: PDFs sobre arquitectura de computadoras."
        echo "  sistemas_digitales               → Abre la sesión de Sistemas Digitales: PDFs sobre diseño de sistemas digitales en Verilog y SystemVerilog."
        echo "  sistemas_digitales_verilog       → Abre la sesión de Sistemas Digitales con Verilog: PDFs sobre diseño de sistemas digitales utilizando Verilog."
        echo "  sistemas_digitales_systemverilog → Abre la sesión de Sistemas Digitales con SystemVerilog: PDFs sobre diseño de sistemas digitales utilizando SystemVerilog."
        echo "  verificacion_funcional           → Abre la sesión de Verificación Funcional: PDFs sobre verificación funcional en SystemVerilog y UVM."
        echo "  verilog                          → Abre la sesión de Verilog: PDFs sobre el lenguaje de descripción de hardware Verilog HDL."
        echo "  systemverilog                    → Abre la sesión de SystemVerilog: PDFs sobre diseño y verificación de sistemas digitales con SystemVerilog."
        echo "  vlsi                             → Abre la sesión de VLSI: PDFs sobre diseño de circuitos integrados de muy alta escala de integración (VLSI)."
        echo "  comunicaciones_electricas        → Abre la sesión de Comunicaciones Eléctricas: PDFs sobre comunicaciones eléctricas."
        echo "  programacion                     → Abre la sesión de Programación: PDFs sobre lenguajes de programación como C, C++, entre otros."
        echo ""
        echo "  --help                           → Muestra este mensaje de ayuda."
}


    case $variable in
        --help)
            _foxit_help
            return 0
            ;;
        arquitectura)
            _foxit_open_txt "$session_arquitectura"
            ;;
        sistemas_digitales)
            _foxit_open_txt "$session_sistemas_digitales"
            ;;
        sistemas_digitales_verilog)
            _foxit_open_txt "$session_sistemas_digitales_verilog"
            ;;
        sistemas_digitales_systemverilog)
            _foxit_open_txt "$session_sistemas_digitales_systemverilog"
            ;;
        verificacion_funcional)
            _foxit_open_txt "$session_verificacion_funcional"
            ;;
        verilog)
            _foxit_open_txt "$session_verilog"
            ;;
        systemverilog)
            _foxit_open_txt "$session_systemverilog"
            ;;
        vlsi)
            _foxit_open_txt "$session_vlsi"
            ;;
        comunicaciones_electricas)
            _foxit_open_txt "$session_comunicaciones_electricas"
            ;;
        programacion)
            _foxit_open_txt "$session_programacion"
            ;;
        "")
            _foxit_alias
            ;;
        *)
            echo "Error: Opción no válida. Usa 'foxit --help' para ver las opciones disponibles."
            return 1
            ;;
    esac
}


# foxit(){
#         local variable="$1"

#         local session_arquitectura="$HOME/.bashrc.d/.foxit_session/.foxit_session_arquitectura.txt"
#         local session_sistemas_digitales="$HOME/.bashrc.d/.foxit_session/.foxit_session_sistemas_digitales.txt"
#         local session_vlsi="$HOME/.bashrc.d/.foxit_session/.foxit_session_vlsi.txt"
#         local session_verificacion_funcional="$HOME/.bashrc.d/.foxit_session/.foxit_session_verificacion_funcional.txt"
#         local session_verilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_verilog.txt"
#         local session_systemverilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_systemverilog.txt"
#         local session_sistemas_digitales_systemverilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_sistemas_digitales_systemverilog.txt"
#         local session_sistemas_digitales_verilog="$HOME/.bashrc.d/.foxit_session/.foxit_session_sistemas_digitales_verilog.txt"
#         local session_comunicaciones_electricas="$HOME/.bashrc.d/.foxit_session/.foxit_session_comunicaciones_electricas.txt"
#         local session_programacion="$HOME/.bashrc.d/.foxit_session/.foxit_session_programacion.txt"

#         case $variable in
#                 arquitectura)
#                         _foxit_open_txt "$session_arquitectura"
#                         ;;
#                 sistemas_digitales)
#                         _foxit_open_txt "$session_sistemas_digitales"
#                         ;;
#                 sistemas_digitales_verilog)
#                         _foxit_open_txt "$session_sistemas_digitales_verilog"
#                         ;;
#                 sistemas_digitales_systemverilog)
#                         _foxit_open_txt "$session_sistemas_digitales_systemverilog"
#                         ;;
#                 verificacion_funcional)
#                         _foxit_open_txt "$session_verificacion_funcional"
#                         ;;
#                 verilog)
#                         _foxit_open_txt "$session_verilog"
#                         # eval $(echo -e "nohup $_foxit_open_txt $session_verilog &")
#                         ;;
#                 systemverilog)
#                         _foxit_open_txt "$session_systemverilog"
#                         # eval $(echo -e "nohup $_foxit_open_txt $session_verilog &")
#                         ;;
#                 vlsi)
#                         _foxit_open_txt "$session_vlsi"
#                         ;;
#                 comunicaciones_electricas)
#                         _foxit_open_txt "$session_comunicaciones_electricas"
#                         ;;
#                 programacion)
#                         _foxit_open_txt "$session_programacion"
#                         ;;
#                 "")
#                         _foxit_alias
#                         ;;
#                 *)      
#                         ;;
#         esac
# }

############################################### funciones para okular ###############################################

# Función para abrir el archivo de texto con los nombres de los pdf's
okular_pdf_arreglo=()

_okular_open_txt(){
        local okular_session="$1"

        while IFS= read -r archivo; do
                # okular_pdf_arreglo="$okular_pdf_arreglo \"$archivo\" "
                okular_pdf_arreglo+=("\"$archivo\"")
        done < "$okular_session"

        # echo -e "Archivos okular: \n ${okular_pdf_arreglo[@]}"
        _okular_mostrar_archivos okular_pdf_arreglo
}

_okular_mostrar_archivos(){
        local -n arreglo="$1"

        for item in "${arreglo[@]}"; do
                echo -e "$item"
        done
}

_okular_autocomplete() {
    local cur="${COMP_WORDS[COMP_CWORD]}" # Lo que el usuario ha escrito hasta el momento

    # Lista de opciones para el autocomplementado
    local options="verilog vlsi verificacion_funcional sistemas_digitales c_programacion"

    # Generar las posibles sugerencias
    COMPREPLY=( $(compgen -W "${options}" -- "${cur}") )
}

# Registra la función de autocompletado para el comando foxit
complete -F _okular_autocomplete okular_session


okular_session(){
        local variable="$1"

        local okular_session_verilog="$HOME/.bashrc.d/.okular_session/.okular_session_verilog.txt"
        local okular_session_vlsi="$HOME/.bashrc.d/.okular_session/.okular_session_vlsi.txt"
        local okular_session_verificacion_funcional="$HOME/.bashrc.d/.okular_session/.okular_session_verificacion_funcional.txt"
        local okular_session_sistemas_digitales="$HOME/.bashrc.d/.okular_session/.okular_session_sistemas_digitales.txt"
        local okular_session_programacion="$HOME/.bashrc.d/.okular_session/.okular_session_programacion.txt"

        case $variable in
                verilog)
                        _okular_open_txt "$okular_session_verilog"
                        eval okular $(echo "${okular_pdf_arreglo[@]}")
                        ;;
                vlsi)
                        _okular_open_txt "$okular_session_vlsi"
                        eval okular $(echo "${okular_pdf_arreglo[@]}")
                        ;;
                verificacion_funcional)
                        _okular_open_txt "$okular_session_verificacion_funcional"
                        eval okular $(echo "${okular_pdf_arreglo[@]}")
                        ;;
                sistemas_digitales)
                        _okular_open_txt "$okular_session_sistemas_digitales"
                        eval okular $(echo "${okular_pdf_arreglo[@]}")
                        ;;
                programacion)
                        _okular_open_txt "$okular_session_programacion"
                        eval okular $(echo "${okular_pdf_arreglo[@]}")
                        ;;
                "")
                        okular
                        ;;
                *)      
                        ;;
        esac
}

###################################################### XRANDER ######################################################

# Hacer función para controlar el brillo de los monitores
# TODO: Hacer un script que se actualice conforme pasa el día

_lumos_monitor_autocomplete() {
    local cur="${COMP_WORDS[COMP_CWORD]}" # Lo que el usuario ha escrito hasta el momento

    # Lista de opciones para el autocomplementado
    local options="HDMI-A-0 DisplayPort-0 both"
#     local options="MSI DAHUA both"

    # Generar las posibles sugerencias
    COMPREPLY=( $(compgen -W "${options}" -- "${cur}") )
}

# Registra la función de autocompletado para el comando foxit
complete -F _lumos_monitor_autocomplete lumos_monitor

lumos_monitor(){
        # monitor principal eDP
        # monitor secundario HDMI-A-0
        # monitor terciario DisplayPort-0
        # monitor ambos both
        # comando de brillo:  xrandr --output nombre_monitor --brightness valor_brillo
        
        local monitor_local="$1"
        local monitor_brillo="$2"
        
        case $monitor_local in
                HDMI-A-0)
                        xrandr --output "$monitor_local" --brightness "$monitor_brillo"
                        ;;
                DisplayPort-0)
                        xrandr --output "$monitor_local" --brightness "$monitor_brillo"
                        ;;
                both)
                        xrandr --output HDMI-A-0 --brightness "$monitor_brillo" 
                        xrandr --output DisplayPort-0 --brightness "$monitor_brillo"
                        ;;
                "")
                        xrandr --listmonitors
                        ;;
                *)
                        ;;
        esac
}


# Definimos una función genérica para manejar todos los alias de carpetas

# wine_exe(){
#         #local wine_stderr=$(cat ~/.bashrc.d/.bashrc_wine_stderr.txt)
        
#         local foxit_exe="$HOME/.wine/drive_c/Program Files (x86)/Foxit Software/Foxit PDF Reader/FoxitPDFReader.exe"
#         local office_exe="" # Completar cuando se instale Office
#         local ltspice_exe="" # Completar cuando se instale LTSpice

#         # Variable para el comando de entrada
#         local exe="$1"

#         case "$exe" in
#                 foxit)
#                         wine "$foxit_exe"
#                         ;;
#                 office)
#                         # Añadir el comando para ejecutar Office cuando esté disponible
#                         echo "wine office"
#                         ;;
#                 ltspice)
#                         # Añadir el comando para ejecutar Office cuando esté disponible
#                         echo "wine ltsice"
#                         ;;
#                 "")
#                         # eval $(wine $(2>&1) | grep -E '^(wine|fixme|err):' )
#                         # "$wine_stderr"
#                         echo "Error: No se especificó ningún programa a ejecutar."
#                         echo "Uso: winexe [foxit|office|ltspice]"
#                         ;;
#                 *)
#                         echo "Comando no reconocido: $exe"
#                         ;;
#         esac
# }