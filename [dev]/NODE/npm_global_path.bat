@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-03-09
::FILE npm_global_path
::DESC set global path for npm


:v
set echo_path=enter path for global npm


:check
if "%path%"=="" (
    set /p path=%echo_path%
)


:set
echo ...
npm config set prefix "%path%"


:end

exit /b