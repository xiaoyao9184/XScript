@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2018-09-18
::enable-gpedit_msc-for_win10_home
::enable gpedit msc for windows 10 home version


:v

SET tip=enable:gpedit.msc
SET ver=1.0


:title

TITLE %tip% %ver%

ECHO enable gpedit.msc
ECHO:


:uac

WHOAMI /GROUPS | FIND "12288" >nul
IF ERRORLEVEL 1 (
    ECHO Auto requires elevated privileges...
    SET script_file=%~f0
    ( mshta "vbscript:CreateObject("shell.Application").ShellExecute("%~f0","","","runas",1)(window.close)" ) & GOTO:EOF
)
ECHO Now runas root.


:enable

PUSHD "%~dp0"

DIR /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >package-list.txt

DIR /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>package-list.txt

FOR /f %%i IN ('FINDSTR /i . package-list.txt 2^>NUL') DO dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"

DEL package-list.txt

PAUSE


:exit

EXIT \b