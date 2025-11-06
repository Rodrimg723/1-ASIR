@echo off
setlocal enabledelayedexpansion

:: os recuerdo que yo como soy viejuno me gusta usar "rem" para comentar
:: pero siempre podéis usar "::"

set "origen=C:\Users\Alumno\Desktop\Scripts\log_config_red.txt"
set "destino=C:\Users\Alumno\Desktop\BACKUP_PARA_CLASE\BACKUP.txt"
set contador=1

rem Crea el directorio destino si no existe
if not exist "%destino%" mkdir "%destino%"

rem Recorre los archivos .txt del origen
for %%F in (%origen%\*.txt) do (
    copy "%%F" "%destino%\copia_!contador!.txt"
    echo Copiado: %%F como copia_!contador!.txt
    set /a contador+=1
    if !contador! gtr 5 goto :fin
)

:fin
pause
endlocal
