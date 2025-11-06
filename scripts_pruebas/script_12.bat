@echo off
setlocal enabledelayedexpansion

set /a contador=0

:while_loop
if %contador% lss 8 (
    echo Contador: %contador%
    set /a contador+=1
    goto while_loop
)