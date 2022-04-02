@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184
::POWERD BY iBAT 1.6


:download

IF NOT EXIST "%USERPROFILE%\.cache\xmlstarlet\xmlstarlet-1.6.1-win32.zip" (
	MKDIR "%USERPROFILE%\.cache\xmlstarlet\"
	SET xmlstarlet_url=https://nchc.dl.sourceforge.net/project/xmlstar/xmlstarlet/1.6.1/xmlstarlet-1.6.1-win32.zip
	ECHO download xmlstarlet from !xmlstarlet_url!
	BITSADMIN /transfer "download xmlstarlet" !xmlstarlet_url! %~dp0.cache\xmlstarlet\xmlstarlet-1.6.1-win32.zip
)
POWERSHELL Expand-Archive -Path %USERPROFILE%\.cache\xmlstarlet\xmlstarlet-1.6.1-win32.zip -DestinationPath %USERPROFILE%\.cache\xmlstarlet\ -Force	
SET xmlstarlet_path=%USERPROFILE%\.cache\xmlstarlet\xmlstarlet-1.6.1

:start

ECHO:
ECHO read xml node by xmlstarlet.exe

SET node="//root/element/url"
ECHO read all node %node%
ECHO:
%xmlstarlet_path%\xml.exe sel -t -v %node% %~dp0\%~n0.xml
ECHO:

ECHO:
ECHO get all node by xmlstarlet.exe

FOR /f %%i IN ('%xmlstarlet_path%\xml.exe sel -t -v %node% %~dp0\%~n0.xml') DO (
	ECHO %%i
	SET last=%%i
)
ECHO last node value is %last%

PAUSE