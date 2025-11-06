@echo off
set /p nombreUsuario = Introduzca su nombre de usuario:
set /p password = Introduzca su contraseña:

net user %nombreUsuarios% %password% /add
pause
echo Se ha creado el usuario %nombreUsuario% con la contraseña %password%
pause
