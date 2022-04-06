@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-10-24
::FILE GITINSPECTOR_HTML
::DESC run gitinspector with "--format=html --timeline --localize-output -w" options




:v

::1������ֵ
%~d0
cd %~dp0
set d=%date:~0,10%
set t=%time:~0,8%
set tip=VCSͳ�Ƴ���gitinspectorͳ��HTML����
set ver=1.0
set gitinspectorPath=%cd%\gitinspector
set projectName=
set projectPath=
set reportPath=

set tipChoice_gitinspector=gitinspectorδ�ҵ���ͨ�������¡��[Y�ǣ�N���ֶ�ָ��·��]��
set tipEcho_gitinspectorPath=��Ҫ����gitinspector·��
set tipSet_gitinspectorPath=������gitinspector·����Ȼ��س���
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
if not exist %gitinspectorPath% (
    goto :choice
)
goto :choiceEnd

:choice
set /P c=%tipChoice_gitinspector%
if /I "%c%" EQU "Y" goto :clone
if /I "%c%" EQU "y" goto :clone
if /I "%c%" EQU "N" goto :set
if /I "%c%" EQU "n" goto :set
goto :choice

:clone
git clone https://github.com/ejwa/gitinspector.git
goto :choiceEnd

:set
echo %tipEcho_gitinspectorPath%
set /p gitinspectorPath=%tipSet_gitinspectorPath%
goto :choiceEnd

:choiceEnd

if "%reportPath%"=="" (
    for %%p in (!gitinspectorPath!) do (
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
echo gitinspectorĿ¼��%gitinspectorPath%
echo ��ĿĿ¼Ϊ��%projectPath%
echo ��Ŀ���ƣ�%projectName%
echo ��Ŀͳ�����Ŀ¼��%reportPath%
echo ��Ŀͳ������ļ���%projectName%_%d:/=-%_%t::=-%.html
if "%makeSure%"=="true" pause
echo ������...      Ctrl+C��������




:begin

python %gitinspectorPath%\gitinspector.py --format=html --timeline --localize-output -w %projectPath% > %reportPath%\%projectName%_%d:/=-%_%t::=-%.html




:exit
echo �Ѿ�ִ����ϣ����Խ����˳���

pause
