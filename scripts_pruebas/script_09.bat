@echo off
setlocal 

set "origen=log_config_red.txt"

for /L %%i in (1,1,5) do (
    copy "%origen%" "archivo%%i.txt"
    echo Copiado como archivo_%%i.txt
)

endlocal