@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-03-09
::FILE 
::DESC download VS2017


:init_param

::auto read from system
::zh-CN: chinese
SET lang=
::17: is VS2022
::16: is VS2019
::15: is VS2017
SET version_main=
::Community
::Professional
::Enterprise
SET version_type=
::A path to download the installation file
SET download_layout=


:init_tip

SET echo_lang=cant auto get system language, please enter one!
SET echo_version_main=input main version[17 is VS2022, 16 is VS2019, 15 is VS2017]:
SET echo_version_type=select version: 1.[C]ommunity 2.[P]rofessional 3.[E]nterprise
SET echo_download_layout=select layout: 1.[U]ser profile cache path 2.[C]urrent work path


:init_variable

SET download_url=https://aka.ms/vs/%version_main%/release/vs_%version_type%.exe
SET download_path=%USERPROFILE%\.cache\visual-studio
SET download_file=%download_path%\vs%version_main%_%version_type%.exe

:check_variable

FOR /F "tokens=3" %%a IN ('REG query "HKCU\Control Panel\Desktop" /v MachinePreferredUILanguages /s ^| FIND "MachinePreferredUILanguages"') DO SET lang=%%a
IF "%lang%"=="" SET /p lang=%echo_lang%

IF "%version_main%"=="" (
    SET /p version_main=%echo_version_main%
    GOTO:init_variable
)

IF "%version_type%"=="" (
    CHOICE /c CPE /m "!echo_version_type!"
    IF !ERRORLEVEL! EQU 1 SET version_type=Community
    IF !ERRORLEVEL! EQU 2 SET version_type=Professional
    IF !ERRORLEVEL! EQU 3 SET version_type=Enterprise
    GOTO:init_variable
)

IF "%download_layout%"=="" (
    CHOICE /c UC /m "!echo_download_layout!"
    IF !ERRORLEVEL! EQU 1 SET download_layout=%USERPROFILE%\.cache\visual-studio\vs%version_main%_%version_type%
    IF !ERRORLEVEL! EQU 2 SET download_layout=%cd%\vs%version_main%_%version_type%
    GOTO:init_variable
)


:download_file

IF NOT EXIST "%download_file%" (
	MKDIR "%download_path%"
	ECHO download from !download_url!
	BITSADMIN /transfer "download" /download /priority normal !download_url! "!download_file!"
)


:download_layout

ECHO:
ECHO lang: %lang%
ECHO layout: %download_layout%

%download_file% --layout %download_layout% --lang %lang% &


:end

EXIT /b






