@echo off
echo Bajando cambios de GitHub...
git pull

echo Encendiendo contenedores...
docker-compose up -d

echo Esperando a que la base de datos este lista (10 segundos)...
timeout /t 10 /nobreak > nul

echo Importando base de datos...
:: Metemos el contenido de backup.sql dentro del contenedor
docker exec -i db /usr/bin/mysql -u usuario --password=oretania wordpress < backup.sql

echo ¡Listo! Entra en http://localhost:8080
pause