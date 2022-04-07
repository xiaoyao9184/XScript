@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-04-27


:uac

WHOAMI /GROUPS | FIND "12288" >nul
IF ERRORLEVEL 1 (
    ECHO Auto requires elevated privileges...
    SET script_file=%~f0
    ( mshta "vbscript:CreateObject("shell.Application").ShellExecute("%~f0","","","runas",1)(window.close)" ) & GOTO:EOF
)
ECHO Now runas root.


:init_tip

SET echo_location_cli=input or drop SqlLocalDB exe path:
SET echo_input_name=input name of SqlLocalDB:
SET echo_input_share=input share name:


:init_variable

SET cli="SqlLocalDB"
SET name=
SET share=


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

IF "%share%"=="" (
    SET /p share=%echo_input_share%
    GOTO:check_variable
)


:tip

ECHO SqlLocalDB cli = %cli%
ECHO SqlLocalDB name = %name%
ECHO SqlLocalDB share = %share%


:start

%cli% share "%name%" "%share%"


:exit

PAUSE