#!/bin/bash

# Definir el directorio de destino para la copia de seguridad
DESTINO="/backup/etc_backup"

# Crear el directorio de destino si no existe
if [ ! -d "$DESTINO" ]; then
    echo "Creando directorio de destino $DESTINO."
    mkdir -p "$DESTINO"
fi

# Realizar la copia de seguridad
echo "Iniciando copia de seguridad de /etc a $DESTINO"
rsync -avzh --delete /etc/ "$DESTINO"

echo "La copia de seguridad se completó exitosamente."
