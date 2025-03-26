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
if "%localVer%"=="1.0" (
    goto v2
)
echo ERROR 404: VERSION_NOT_FOUND
echo No se ha encontrado la versión.
pause
exit

:v1
wget --quiet --no-check-certificate --show-progress "https://spyderrock.com/sd947391-springupdate1.7z" -O %modsPath%\update1.7z
7za.exe x -aoa %modsPath%\update1.7z -o%modsPath%
erase /f /q %modsPath%\update1.7z
:v2
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming.package"
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming_Addon_RequiredPack_Cats&Dogs.package"
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming_Addon_RequiredPack_DiscoverUniversity.package"
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming_Addon_RequiredPack_GetFamous.package"
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming_Addon_RequiredPack_GetTogether.package"
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming_Addon_RequiredPack_IslandLiving.package"
erase /f /q "%modsPath%\Addons\ilkavelle_RealisticSwimming_Addon_RequiredPack_SpaDay.package"
erase /f /q "%modsPath%\Addons\lotharihoe_collectdishesfaster.package"
erase /f /q "%modsPath%\Addons\Plumlace-Sugar-Baby-2.0.package"
erase /f /q "%modsPath%\Addons\LittleMsSam_BetterAutonomousHomework.package"
erase /f /q "%modsPath%\Addons\LittleMsSam_BetterAutonomousHomework_Addon_FasterHomework.package"
erase /f /q "%modsPath%\Addons\LittleMsSam_BetterAutonomousHomework_Addon_HomeworkInInventory.package"
erase /f /q "%modsPath%\Addons\LittleMsSam_BetterAutonomousHomework_Addon_NPCsOnlyAtHome.package"
erase /f /q "%modsPath%\Override\[RheallSim]minimalist_cc_wrench_OVERRIDE-p1.107.package"
erase /f /q "%modsPath%\Career-Traits\Artemissy_Sassy_Trait.package"

:finish_update
echo %cloudVer%> "%CD%\launcher_data\localModVersion.txt"
erase /f /q mods_cloud_version.txt
echo Actualizado correctamente
timeout 1 >NUL
echo Saliendo...
timeout 2 >NUL
exit
:UP_TO_DATE
cls
echo No hay actualizaciones
echo WooHoo ya está actualizado
echo Pulsa ENTER para salir...
pause >nul
exit