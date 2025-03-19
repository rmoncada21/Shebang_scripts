# Función para agregar archivos.bashrc de .bashrc.d/
mkdir -p ~/.bashrc.d
if [ -d ~/.bashrc.d ]; then
	for file in ~/.bashrc.d/*.bashrc; do
		if [ -f "$file" ]; then
			. "$file"
		fi
	done
fi