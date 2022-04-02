@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.1 beta
::TIME 2018-06-28
::OPEN-HOST
::OPEN HOST use notepad


:v

SET tip=HOST:Open hosts
SET ver=1.1


:title

TITLE %tip% %ver%

ECHO HOST:Open hosts
ECHO:


:uac

WHOAMI /GROUPS | FIND "12288" >nul
IF ERRORLEVEL 1 (
    ECHO Auto requires elevated privileges...
	SET script_file=%~f0
	( mshta "vbscript:CreateObject("shell.Application").ShellExecute("%~f0","","","runas",1)(window.close)" ) & GOTO:EOF
)
ECHO Now runas root.


:start

START notepad C:\Windows\System32\drivers\etc\hosts


:exit

EXIT \b