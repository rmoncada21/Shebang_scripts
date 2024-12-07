# Shebang_scripts
Shebang #! scripts


## ¿Qué es el Shebang?

El **shebang** es la primera línea de un script que define el **intérprete** que debe usarse para ejecutar ese script. Se denota con `#!`, seguido de la ruta al programa que se usará para interpretar el script. Esto permite que el script se ejecute directamente desde la terminal sin necesidad de invocar manualmente el intérprete.

### **Ejemplos de shebang en diferentes lenguajes**:

- **Shell (Bash)**: `#!/bin/bash`
- **Shell (Dash)**: `#!/bin/dash`
- **Shell (POSIX)**: `#!/bin/sh`
- **Shell (Zsh)**: `#!/bin/zsh`
- **Shell (Fish)**: `#!/usr/bin/fish`
- **Python**: `#!/usr/bin/python3`
- **Perl**: `#!/usr/bin/perl`
- **Awk**: `#!/usr/bin/awk -f`
- **Tcl**: `#!/usr/bin/tclsh`

---

### **1. Shell**
Una *shell* es un programa que permite al usuario interactuar con el sistema operativo mediante la ejecución de comandos. Es una interfaz que traduce los comandos del usuario en instrucciones que el sistema operativo puede ejecutar.
- **Tipos de shell**:
  - **Bash** (muy común en Linux).
  - **Zsh** (Z Shell, con más personalización).
  - **Fish** (Friendly Interactive Shell, más moderno y fácil de usar).
  - **sh** (Bourne Shell, más básica).
  - **csh**, **ksh**, entre otras.
- **Modo de operación**: Puede usarse de forma interactiva (introduciendo comandos manualmente) o ejecutando scripts.

---

### **2. Bash**
*Bash* es un acrónimo de **Bourne Again SHell**. Es un programa que actúa como una interfaz entre el usuario y el sistema operativo Linux.
- **Función**: Es una de las **shells** más populares en sistemas Linux y Unix. Permite a los usuarios ejecutar comandos, scripts y administrar el sistema.
- **Características**:
  - Compatible con scripts de shell antiguos (es una mejora de la shell original Bourne Shell).
  - Soporta características como el historial de comandos, alias, autocompletado y funciones de scripting avanzadas.

---

### **3. Script**
Un *script* en Linux es un archivo de texto que contiene una serie de comandos que pueden ser ejecutados de manera secuencial o lógica.
- **Uso**:
  - Automatización de tareas repetitivas.
  - Configuración del sistema.
  - Desarrollo de herramientas personalizadas.
- **Ejemplo de un script Bash simple** (`mi_script.sh`):
  ```bash
  #!/bin/bash
  echo "Hola, Mundo"
  ```
  - **`#!/bin/bash`**: Especifica que el script se ejecutará con Bash.
  - **`echo`**: Imprime texto en la pantalla.
- **Ejecución**: Para ejecutar el script:
  ```bash
  chmod +x mi_script.sh  # Da permisos de ejecución
  ./mi_script.sh         # Ejecuta el script
  ```

---

### **4. Prompt**
El *prompt* es el texto que aparece en la terminal y que indica que la shell está lista para recibir comandos.
- **Aspecto típico**: 
  - Puede verse como algo así: 
    ```bash
    usuario@maquina:~$
    ```
  - **Elementos comunes**:
    - `usuario`: Nombre del usuario.
    - `maquina`: Nombre del host o computadora.
    - `~`: Directorio actual (el símbolo `~` indica el directorio personal del usuario).
    - `$`: Símbolo que indica que es un usuario normal (si eres superusuario, verás `#`).
- **Personalización**: Puedes personalizar el *prompt* modificando la variable especial `PS1`. Por ejemplo:
  ```bash
  PS1="\u@\h:\w\$ "
  ```

---

### Resumen en relación
- **Shell**: Programa que actúa como interfaz entre el usuario y el sistema.
- **Bash**: Un tipo específico de shell (y el más común en Linux).
- **Script**: Archivo con comandos que la shell ejecuta de manera automatizada.
- **Prompt**: La línea donde se introduce comandos en la terminal.