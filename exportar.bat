@echo off
echo Exportando base de datos...
:: Extrae la base de datos al archivo backup.sql
docker exec db /usr/bin/mysqldump -u usuario --password=oretania wordpress > backup.sql

echo Subiendo cambios a GitHub...
git add .
git commit -m "Copia de seguridad automatica: %date% %time%"
git push

echo ¡Hecho! Tu trabajo esta seguro en la nube.
pause