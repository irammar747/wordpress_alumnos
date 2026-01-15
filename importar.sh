#!/bin/bash
echo "--- Iniciando Importación ---"

echo "[1/4] Git Pull..."
git pull

echo "[2/4] Levantando Docker..."
docker-compose up -d

echo "[3/4] Esperando a la DB (10 seg)..."
sleep 10

echo "[4/4] Restaurando base de datos..."
docker exec -i db /usr/bin/mysql -u usuario --password=oretania wordpress < backup.sql

echo "--- ¡Listo! Entra en http://localhost:8080 ---"