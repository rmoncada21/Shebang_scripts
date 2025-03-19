# ~/.bashrc.d/functions.bashrc

############################################### funciones para fedora ###############################################

# alias reload_bashrc=". ~/.bashrc"

reload_bashrc(){
        source ~/.bashrc
        echo "source ~/.bashrc"
}

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

#####################################################################################################################