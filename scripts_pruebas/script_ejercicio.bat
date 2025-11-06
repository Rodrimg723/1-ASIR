@echo off
setlocal

set /p IP=Introduce la direccion IP: 
set /p MASCARA=Introduce la mascara de subred: 
set /p PUERTA=Introduce la puerta de enlace: 

netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%

set FECHA=%date:/=-%
set HORA=%time::=-%
set LOG=configuracion_red_%FECHA%_%HORA%.log

echo Fecha: %date% %time% > "%LOG%"
echo IP: %IP% >> "%LOG%"
echo Mascara: %MASCARA% >> "%LOG%"
echo Puerta de enlace: %PUERTA% >> "%LOG%"

echo Configuracion aplicada y registrada en %LOG%
pause


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@rem EJERCICIO DE RECONOCIEMIENTO DE QUE FUNCIÓN TIENE EL SCRIPT:

@echo off

setlocal enabledelayedexpansion

rem Solicita los datos de configuración de red al usuario
set /P IP=Introduce la IP estática: 
set /P MASCARA=Introduce la máscara de subred: 
set /P PUERTA=Introduce la puerta de enlace: 

echo Configurando IP...
rem Aplica la configuración de red usando netsh
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%
echo Configuración aplicada.

rem Solicita rutas para copia de seguridad
set /P ORIGEN=Ruta de origen para la copia: 
set /P DESTINO=Ruta de destino para la copia: 

rem Si la carpeta destino no existe pedimos que la cree
if not exist "%DESTINO%" mkdir "%DESTINO%"

echo Iniciando backup...
rem Realiza la copia de archivos con robocopy, guarda log en log_admin.txt
robocopy "%ORIGEN%" "%DESTINO%" /E /Z /NP /LOG+:log_admin.txt

rem Por último registra en el log la configuración de red y la copia realizada con su fecha y hora
echo --- >> log_admin.txt
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt
echo [%DATE% %TIME%] Copia realizada de "%ORIGEN%" a "%DESTINO%" >> log_admin.txt

echo Operación completada. Revisa el archivo log_admin.txt
pause

