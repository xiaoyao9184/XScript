@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-04-27


:init_tip

SET echo_location_cli=input or drop SqlLocalDB exe path:
SET echo_input_name=input name of SqlLocalDB:


:init_variable

SET cli="SqlLocalDB"
SET name=


:check_variable

SET flag_need_location=false
IF NOT EXIST %cli% (
    SET flag_need_location=true
    FOR /F "delims=" %%l IN ('where SqlLocalDB') DO (
        IF EXIST "%%l" SET flag_need_location=false
    )
)

IF "%flag_need_location%"=="true" (
    SET /p cli=%echo_location_cli%
    GOTO:check_variable
)

IF "%name%"=="" (
    ECHO list installed name by 'SqlLocalDB info'
    FOR /F "delims=" %%l IN ('!cli! i') DO (
        ECHO %%l
    )
    SET /p name=%echo_input_name%
    GOTO:check_variable
)


:tip

ECHO SqlLocalDB cli = %cli%
ECHO SqlLocalDB name = %name%


:start

%cli% delete "%name%"


:exit

PAUSE