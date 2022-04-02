@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-03-09
::FILE set-npm_global_path
::DESC set global path for npm


:v
SET echo_path=enter path for global npm


:check
IF "%path%"=="" (
    SET /p path=%echo_path%
)


:start
npm config set prefix "%path%"


:end

EXIT /b