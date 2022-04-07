@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-04-27


:init_tip

SET echo_location_cli=input or drop SqlLocalDB exe path:
SET echo_input_version=input version of SqlLocalDB[13.0 is 2016, 14.0 is 2017, 15.0 is 2019]:
SET echo_input_name=input name of SqlLocalDB[empty auto create 'MSSQLLocalDB_{version}']:


:init_variable

SET cli="SqlLocalDB"
SET name=
SET version=


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

IF "%version%"=="" (
    ECHO list installed version by 'SqlLocalDB version'
    !cli! v
    ECHO:
    ECHO list installed version by [c:\Program Files\Microsoft SQL Server]
    FOR /F "delims=0" %%l IN ('DIR /b "c:\Program Files\Microsoft SQL Server"') DO (
        ECHO %%l.0
    )

    SET /p version=%echo_input_version%
    GOTO:check_variable
)

IF "%name%"=="" (
    SET /p name=%echo_input_name%
    IF "!name!"=="" SET name=MSSQLLocalDB_%version%
    GOTO:check_variable
)


:tip

ECHO SqlLocalDB cli = %cli%
ECHO SqlLocalDB name = %name%
ECHO SqlLocalDB version = %version%


:start

%cli% create "%name%" %version%


:exit

PAUSE