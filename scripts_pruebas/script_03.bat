echo off
rem condicionalIF simple
set /p edad=Introduzca su edad:
REM pause   
if %edad% LSS 18 (
    echo Eres menor de edad
) else (
    echo Eres mayor de edad
)
pause