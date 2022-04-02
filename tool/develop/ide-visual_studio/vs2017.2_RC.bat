@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-05-12
::FILE 
::DESC download VS2017.2(15.2)


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

if "%version%"=="Community" (
    set downSrc=https://download.microsoft.com/download/2/3/7/2378CD7E-B032-4F85-9BB0-F71AD453639C/vs_Community.exe
)
if "%version%"=="Professional" (
    set downSrc=https://download.microsoft.com/download/4/A/A/4AA3FA19-4BD9-450A-823D-AEA29F62EE26/vs_Professional.exe
)
if "%version%"=="Enterprise" (
    set downSrc=https://download.microsoft.com/download/4/A/A/4AA3FA19-4BD9-450A-823D-AEA29F62EE26/vs_Professional.exe
)
set downloadPath=%~dp0downloads\vs2017.2rc_%version%
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





