#!/bin/bash
echo "--- Iniciando Exportación ---"

# Corregir permisos de los archivos creados por Docker en mi-contenido
sudo chown -R $USER:$USER ./mi-contenido

echo "[1/2] Generando backup.sql..."
docker exec db /usr/bin/mysqldump --no-tablespaces -u usuario --password=oretania wordpress > backup.sql

echo "[2/2] Subiendo a GitHub..."
git add .
git commit -m "Backup automático: $(date +'%d/%m/%Y %H:%M')"
git push

echo "--- ¡Hecho! ---"