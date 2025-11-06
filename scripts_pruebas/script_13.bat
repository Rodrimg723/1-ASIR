@echo off
setlocal enabledelayedexpansion

:pedir
set /p entrada=Escribe "salir" para terminar:

if /i not "%entrada%"=="salir" (
    echo No macho, asi no sales...
    goto pedir
)

echo Saliendo del bucle!
pause