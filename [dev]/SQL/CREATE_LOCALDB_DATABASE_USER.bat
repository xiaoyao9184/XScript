@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-03-24
::FILE 
::DESC 


:v

set echo_instance_name=Enter LocalDB instance name:
set echo_db_name=Enter Database name for create:
set echo_user_name=Enter Login name:
set echo_user_pw=Enter Login password:

set quiet_flag=%1
set instance_name=%1
set db_name=%2
set user_name=%3
set user_pw=%4

:if

if "%instance_name%"=="" (
    sqllocaldb i
    set /p instance_name=%echo_instance_name%
)

if "%db_name%"=="" (
    set /p db_name=%echo_db_name%
)

if "%user_name%"=="" (
    set /p user_name=%echo_user_name%
)

if "%user_pw%"=="" (
    set /p user_pw=%echo_user_pw%
)





:sql_create

set sql=CREATE DATABASE %db_name%
echo execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"

if "%quiet_flag%"=="" (
    pause
)
echo\


:sql_login

set sql=CREATE LOGIN %user_name% WITH PASSWORD = '%user_pw%'
echo execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"

if "%quiet_flag%"=="" (
    pause
)
echo\


:sql_user

set sql=CREATE USER %user_name%
echo execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"

if "%quiet_flag%"=="" (
    pause
)
echo\


:sql_auch

set sql=ALTER AUTHORIZATION ON DATABASE::%db_name% TO %user_name%
echo execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"

if "%quiet_flag%"=="" (
    pause
)
echo\




:end

exit /b