# ~/.bashrc.d/prompt.bashrc

# LabD - WSL Debian

# DEBIAN solo con la ubicación actual
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# DEBIAN con las ultimas dos carpetas del path
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(basename $(dirname $(pwd)))/$(basename $(pwd))\[\033[00m\]\$ '
