@echo off
setlocal enabledelayedexpansion
for /f "tokens=1 delims= " %%a in (archivo.csv) do (
    set "linea=%%a"
    echo Linea: !linea!
)
pause
