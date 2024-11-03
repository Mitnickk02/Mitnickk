#!/bin/bash

# Función para mostrar el saludo y la fecha
mostrar_saludo() {
    echo "Hola, te saluda Mitnick."
    echo "La fecha actual es: $(date)"
    echo "-------------------------"
}

# Función para mostrar información del sistema
informacion_sistema() {
    echo "Información del sistema:"
    echo "-------------------------"
    echo "Nombre del dispositivo: $(getprop ro.product.model)"
    echo "Versión de Android: $(getprop ro.build.version.release)"
    echo "Memoria disponible:"
    free -h
    echo "-------------------------"
}

# Función para mostrar el nivel de batería
nivel_bateria() {
    echo "Nivel de batería actual:"
    termux-battery-status | grep percentage
    echo "-------------------------"
}

# Función para mostrar el almacenamiento
espacio_almacenamiento() {
    echo "Espacio de almacenamiento disponible:"
    df -h | grep '/data'
    echo "-------------------------"
}

# Función para mostrar el clima (requiere Internet)
mostrar_clima() {
    echo "El clima actual en tu ubicación (requiere acceso a Internet):"
    termux-location -p network > /dev/null  # Obtener ubicación aproximada
    curl -s "wttr.in/?format=3"
    echo "-------------------------"
}

# Menú interactivo
while true; do
    mostrar_saludo
    echo "Selecciona una opción:"
    echo "1) Información del sistema"
    echo "2) Nivel de batería"
    echo "3) Espacio de almacenamiento"
    echo "4) Clima"
    echo "5) Salir"
    echo "-------------------------"
    read -p "Opción: " opcion

    case $opcion in
        1) informacion_sistema ;;
        2) nivel_bateria ;;
        3) espacio_almacenamiento ;;
        4) mostrar_clima ;;
        5) echo "¡Hasta luego!" ; break ;;
        *) echo "Opción no válida, intenta de nuevo." ;;
    esac
    echo
done
