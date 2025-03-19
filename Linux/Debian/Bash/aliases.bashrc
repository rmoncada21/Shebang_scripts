# ~/.bashrc.d/aliases.bashrc

# =============================
#       ALIASES CONFIG
# =============================

##############################################
## Fedora / Terminal Aliases
##############################################
alias ll="ls -l"
alias la="ls -la"
alias salto="echo -e '\n'"
alias matlab_address="cd /mnt/c/Users/UserName/MATLAB\ Drive"
alias _foxit_alias="wine ~/.wine/drive_c/'Program Files (x86)'/'Foxit Software'/'Foxit PDF Reader'/FoxitPDFReader.exe"

# Accesos rápidos a repositorios en GitHub
alias gr="cd ~/Github/UserName/ && ll"
alias grr="cd ~/Github/UserName/ && clear"
alias gm="cd ~/Github/UserName/ && ll"
alias gmm="cd ~/Github/UserName/ && clear"

##############################################
## GitHub Aliases
##############################################
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gch="git checkout"
alias push="git push"
alias pull="git pull --rebase"