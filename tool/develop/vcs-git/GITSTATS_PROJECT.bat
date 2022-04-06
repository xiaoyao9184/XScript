@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-10-24
::FILE GITSTATS_PROJECT
::DESC run gitstats 
::
::python gitstats /E/Work/PDASurvey_Web /E/Work/Java/.gitstats/PDASurvey_Web




:v

::1������ֵ
%~d0
cd %~dp0
set d=%date:~0,10%
set t=%time:~0,8%
set tip=VCSͳ�Ƴ���GITSTATSͳ������
set ver=1.0
set gitstatsPath=%cd%\gitstats
set projectName=
set projectPath=
set reportPath=

set tipChoice_gitstats=gitstatsδ�ҵ���ͨ�������¡��[Y�ǣ�N���ֶ�ָ��·��]��
set tipEcho_gitstatsPath=��Ҫ����gitstats·��
set tipSet_gitstatsPath=������gitstats·����Ȼ��س���
set tipEcho_projectPath=��Ҫ����Git������Դ��·��
set tipSet_projectPath=������Git������Դ��·����Ȼ��س���
set tipEcho_projectName=��Ҫ����Git��Ŀ����
set tipSet_projectName=������Git��Ŀ���ƣ�Ȼ��س���




:title
title %tip% %ver%

echo %tip%
echo ����رգ�����
echo ...




:check

::3�������� ��������
if not exist %gitstatsPath% (
    goto :choice
)
goto :choiceEnd

:choice
set /P c=%tipChoice_gitstats%
if /I "%c%" EQU "Y" goto :clone
if /I "%c%" EQU "y" goto :clone
if /I "%c%" EQU "N" goto :set
if /I "%c%" EQU "n" goto :set
goto :choice

:clone
git clone https://github.com/hoxu/gitstats.git
goto :choiceEnd

:set
echo %tipEcho_gitstatsPath%
set /p gitstatsPath=%tipSet_gitstatsPath%
goto :choiceEnd

:choiceEnd

if "%reportPath%"=="" (
    for %%p in (!gitstatsPath!) do (
        set reportPath=%%~dpp
    )
)

if "%projectPath%"=="" (
    echo %tipEcho_projectPath%
    set /p projectPath=%tipSet_projectPath%
        set makeSure=true
)

if "%projectName%"=="" (
    for %%p in (!projectPath!) do (
        set projectName=%%~np
    )
)




:tip
echo gitstatsĿ¼��%gitstatsPath%
echo ��ĿĿ¼Ϊ��%projectPath%
echo ��Ŀ���ƣ�%projectName%
echo ��Ŀͳ�����Ŀ¼��%reportPath%
if "%makeSure%"=="true" pause
echo ������...      Ctrl+C��������




:begin

python %gitstatsPath%\gitstats.py %projectPath% %reportPath%




:exit
echo �Ѿ�ִ����ϣ����Խ����˳���

pause
