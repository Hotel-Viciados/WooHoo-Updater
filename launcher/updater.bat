@echo off
chcp 65001>NUL
mode con:cols=70 lines=15
title WooHoo Updater // Main
set modsPath="%USERPROFILE%\Documents\Electronic Arts\Los Sims 4_mp0\Mods"
set /p localVer=<"%CD%\launcher_data\localModVersion.txt"
set /p cloudVer=<mods_cloud_version.txt
set decompressorLink=https://spyderrock.com/6M9y2638-7za.exe
if "%localVer%"=="%cloudVer%" (
    goto UP_TO_DATE
) else (
    goto UPDATE_FOUND
)

:UPDATE_FOUND
cls
echo Descargando librerías...
wget.exe --quiet --no-check-certificate "%decompressorLink%" -O 7za.exe
if "%localVer%"=="0.0" (
    goto v1
)
echo ERROR 404: VERSION_NOT_FOUND
echo No se ha encontrado la versión.
pause
exit

:v1
wget --quiet --no-check-certificate --show-progress "update-link" -O %modsPath%\update1.7z
7za.exe x -aoa %modsPath%\update1.7z -o%modsPath%
erase /f /q %modsPath%\update1.7z

:finish_update
echo %cloudVer%> "%CD%\launcher_data\localModVersion.txt"
erase /f /q mods_cloud_version.txt
echo Actualizado correctamente
timeout 1 >NUL
echo Saliendo...
timeout 2 >NUL
:UP_TO_DATE
cls
echo No hay actualizaciones
echo WooHoo ya está actualizado
echo Pulsa ENTER para salir...
pause >nul
exit