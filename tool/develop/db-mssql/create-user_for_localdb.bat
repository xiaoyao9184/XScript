@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-03-24
::FILE create-user_for_localdb
::DESC 


:v

SET echo_instance_name=Enter LocalDB instance name:
SET echo_db_name=Enter Database name for create:
SET echo_user_name=Enter Login user name:
SET echo_user_password=Enter Login user password:

SET quiet_flag=%1
SET instance_name=%1
SET db_name=%2
SET user_name=%3
SET user_password=%4


:check

IF "%instance_name%"=="" (
    sqllocaldb i
    SET /p instance_name=%echo_instance_name%
)

IF "%db_name%"=="" (
    SET /p db_name=%echo_db_name%
)

IF "%user_name%"=="" (
    SET /p user_name=%echo_user_name%
)

IF "%user_password%"=="" (
    SET /p user_password=%echo_user_password%
)


:create
ECHO:

SET sql=CREATE DATABASE %db_name%
ECHO execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"
IF "%quiet_flag%"=="" PAUSE

SET sql=CREATE LOGIN %user_name% WITH PASSWORD = '%user_password%'
ECHO execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"
IF "%quiet_flag%"=="" PAUSE

SET sql=CREATE USER %user_name%
ECHO execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"
IF "%quiet_flag%"=="" PAUSE

SET sql=ALTER AUTHORIZATION ON DATABASE::%db_name% TO %user_name%
ECHO execute this: %sql%
sqlcmd -S "(localdb)\%instance_name%" -Q "%sql%"
IF "%quiet_flag%"=="" PAUSE


:end

EXIT /b