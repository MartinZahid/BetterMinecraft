#!/bin/bash

# xRuta al script de inicio del servidor de Minecraft
START_SCRIPT="/home/ubuntu/BetterMinecraft/start.sh"

# Ruta al directorio del repositorio Git
REPO_DIR="/home/ubuntu/BetterMinecraft"

# Nombre del proceso del servidor de Minecraft
MINECRAFT_PROCESS_NAME="java"

# Función para cerrar el servidor de Minecraft
stop_server() {
    echo "Deteniendo el servidor de Minecraft..."
    pkill -f $MINECRAFT_PROCESS_NAME
    sleep 10 # Espera a que el proceso se detenga completamente
}

# Función para hacer commit en el repositorio Git
commit_changes() {
    echo "Haciendo commit de los cambios..."
    cd $REPO_DIR
    git add .
    current_date=$(date +"%Y-%m-%d %H:%M:%S")
    git commit -m "Commit automático antes de reiniciar el servidor - $current_date"
    git push
}

# Función para iniciar el servidor de Minecraft
start_server() {
    echo "Iniciando el servidor de Minecraft..."
    $START_SCRIPT 
}

# Ejecutar las funciones
stop_server
commit_changes
start_server

echo "Proceso completado."

