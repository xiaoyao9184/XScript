@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-03-09
::FILE 
::DESC download VS2017


:v

set echo_lang=cant auto get system language, please enter one!
set echo_select=select version: 1.[C]ommunity 2.[P]rofessional 3.[E]nterprise
set echo_file_exists=
set eaco_file_down=
::Community
::Professional
::Enterprise
set version=
set lang=


:v_create

set downSrc=https://aka.ms/vs/15/release/vs_%version%.exe
set downloadPath=%~dp0downloads\vs2017rc_%version%
set exeFile=%~dp0vs_%version%.exe

rem exeFile = %exeFile%
rem exeFile2 = %name%.exe


:if

FOR /F "tokens=3" %%a IN ('reg query "HKCU\Control Panel\Desktop" /v MachinePreferredUILanguages /s ^| find "MachinePreferredUILanguages"') DO set lang=%%a

if "%lang%"=="" (
    set /p lang=%echo_lang%
)

if not "%version%"=="" (
    goto if_file
)

choice /c CPE /m "%echo_select%"
if !errorlevel! equ 1 set version=Community
if !errorlevel! equ 2 set version=Professional
if !errorlevel! equ 3 set version=Enterprise

goto v_create


:if_file

if exist "%exeFile%" (
    echo file exists: %exeFile%
    goto begin
) else (
    echo file doesn't exist: %exeFile%, will download
    pause 
    goto download
)


:download

bitsadmin /transfer downLoad-%name% /download /priority normal "%downSrc%" "%exeFile%"


:begin

echo ...
echo layout: %downloadPath%
echo lang: %lang%

::start "" "%exeFile%" "--layout %downloadPath% --lang %lang%"
%exeFile% --layout %downloadPath% --lang %lang% &


:end

exit /b






