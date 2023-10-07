#!/bin/bash

# Función para imprimir mensajes en color
print_color() {
    echo -e "\e[1;32m$1\e[0m"
}

# Función para imprimir mensajes en amarillo (opciones)
print_yellow() {
    echo -e "\e[1;33m$1\e[0m"
}

# Función para instalar XFCE4 y limpiar aplicaciones innecesarias
install_xfce4() {
    print_color "Bienvenido a la instalación de XFCE4 en Arch Linux."

    # Instalación de XFCE4 y aplicaciones recomendadas
    print_color "Instalando XFCE4..."
    sudo pacman -S --noconfirm xfce4 xfce4-goodies lxdm pcmanfm gtk3 libfm gvfs firefox 

    # Configuración de lxdm
    sudo systemctl enable lxdm

    # Eliminación de aplicaciones innecesarias
    print_color "Eliminando aplicaciones innecesarias..."
    sudo pacman -Rns --noconfirm hexchat pidgin parole orage gvfs gvfs-mtp gvfs-gphoto2 thunar-archive-plugin xfce4-dict xfce4-notes-plugin xfburn

    # Mensaje final
    print_color "La instalación ha finalizado. Puedes reiniciar ahora."
}

# Menú de opciones
while true; do
    echo "Selecciona las opciones que deseas instalar:"
    echo "1. XFCE4 con limpieza de aplicaciones innecesarias"
    echo "2. Salir"

    read -p "Opciones (separadas por espacio): " options

    for option in $options; do
        case $option in
            1) install_xfce4; exit ;;
            2) exit ;;
            *) echo "Opción no válida: $option";;
        esac
    done
done
