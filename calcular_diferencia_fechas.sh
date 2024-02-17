#!/bin/bash

echo "Introduzca la fecha de inicio (día/mes/año):"
read fecha_inicio
echo "Introduzca la hora de inicio (hh:mm) o presione enter para omitir:"
read hora_inicio

echo "Introduzca la fecha de finalización (día/mes/año):"
read fecha_fin
echo "Introduzca la hora de finalización (hh:mm) o presione enter para usar 23:59 por defecto:"
read hora_fin

# Convertir fecha de DD/MM/YYYY a YYYY-MM-DD
convertir_fecha() {
    IFS="/" read -r dia mes anio <<< "$1"
    echo "$anio-$mes-$dia"
}

fecha_inicio=$(convertir_fecha "$fecha_inicio")
fecha_fin=$(convertir_fecha "$fecha_fin")

# Establecer hora de inicio y fin por defecto si no se proporciona
if [ -z "$hora_inicio" ]; then
    hora_inicio="00:00"
fi

if [ -z "$hora_fin" ]; then
    hora_fin="23:59"
fi

# Formato completo de fecha y hora para cálculo
inicio="$fecha_inicio $hora_inicio"
fin="$fecha_fin $hora_fin"

# Convertir fechas a segundos desde la época (UNIX timestamp)
inicio_sec=$(date -d "$inicio" +%s)
fin_sec=$(date -d "$fin" +%s)

# Calcular la diferencia en segundos y luego en días y horas
diferencia_sec=$((fin_sec - inicio_sec))
dias=$((diferencia_sec / 86400))
horas=$(( (diferencia_sec % 86400) / 3600 ))

echo "Diferencia total: $dias días y $horas horas."
