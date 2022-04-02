@REM https://www.robvanderwoude.com/battech_elevation.php
@ECHO OFF
SETLOCAL EnableDelayedExpansion


ECHO:
ECHO Use "AT" for check
AT >NUL 2>&1
IF ERRORLEVEL 1 (
	ECHO This batch file requires elevated privileges
)

ECHO:
ECHO Use "OPENFILES" for check
OPENFILES >NUL 2>&1
IF ERRORLEVEL 1 (
	ECHO This batch file requires elevated privileges
)

ECHO:
ECHO Use "CACLS" for check
CACLS "%SYSTEMROOT%\system32\config\system"
IF ERRORLEVEL 1 (
	ECHO This batch file requires elevated privileges
)

ECHO:
ECHO Use "WHOAMI" for check
WHOAMI /Groups | FIND "12288" >NUL
IF ERRORLEVEL 1 (
	ECHO This batch file requires elevated privileges
)