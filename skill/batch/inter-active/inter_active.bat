@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2018-11-20
::FILE inter_active
::DESC test inter active check


::default is interactive
::double clicking is outer call and will set 0
ECHO default inter active: true
SET interactive=1

::just tip
ECHO:
ECHO show 'CMDCMDLINE' and script file info
ECHO     CMDCMDLINE is: %CMDCMDLINE%
ECHO     this argument 0 is: %0
ECHO     this script file is: %~0

::find script file in CMDCMDLINE
ECHO %CMDCMDLINE% | FIND /i """""%~0"" """ >NUL

::just tip
ECHO:
ECHO try find ""%~0" " in 'CMDCMDLINE'
ECHO     ERRORLEVEL is: %ERRORLEVEL%
IF %ERRORLEVEL% EQU 0 (
    ECHO     String found in at least one of the files.
) ELSE IF %ERRORLEVEL% EQU 1 (
    ECHO     String not found
) ELSE IF %ERRORLEVEL% EQU 2 (
    ECHO     If any files in the list do not exist or if no files match a wildcard mask. An invalid switch is given.
)

::change interactive
ECHO:
IF NOT %ERRORLEVEL% EQU 1 (
    ECHO change inter active: false
    SET interactive=0
) ELSE (
    ECHO default inter active
)


::detect the jenkins environment
ECHO:
IF _%JENKINS_HOME%_ neq __ (
    ECHO skip pause detected in the jenkins environment!
) ELSE (
    PAUSE
)


EXIT /b