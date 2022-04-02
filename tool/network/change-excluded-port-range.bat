@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184


:v

SET echo_start=enter start port for exclude
SET echo_num=enter num port for exclude

:show

netsh interface ipv4 show excludedportrange protocol=tcp


:check

IF "%1"=="" (
    SET /p port_start=%echo_start%
) ELSE (
    SET port_start=%1
)
IF "%2"=="" (
    SET /p port_num=%echo_num%
) ELSE (
    SET port_num=%2
)

:change

netsh int ipv4 set dynamicport tcp start=%port_start% num=%port_num%


PAUSE