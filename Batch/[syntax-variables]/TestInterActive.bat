@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2018-11-20
::FILE TestInterActive
::DESC test inter active check


::default is inter
echo set inter active = ture
set interactive=1
echo -----
::
::
::
::
::
::
echo check cmdcmdline inclue this script file
echo     cmdcmdline is: %cmdcmdline%
echo     this argument 0 is: %0
echo     this script file is: %~0
echo try find ""%~0" "
echo -----

echo %cmdcmdline% | find /i """""%~0"" """ >nul
echo     errorlevel is: %errorlevel%
if %errorlevel% equ 0 (
    echo String found in at least one of the files.
) else if %errorlevel% equ 1 (
    echo String not found
) else if %errorlevel% equ 2 (
    echo If any files in the list do not exist or if no files match a wildcard mask. An invalid switch is given.
)
echo -----

::double-clicking is outer call and will set 0
if not errorlevel 1 (
    set interactive=0
    echo set inter active = false
) else (
    echo not set inter active
)
echo -----


::JENKINS
if _%JENKINS_HOME%_ neq __ (
    echo Used in Jenkins no pause!
) else (
    pause
)
exit 1