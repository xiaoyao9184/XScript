@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-04-27
::FILE set_npm
::DESC set npm for chinese


:v
set gPath="c:\nodejs"
set useSSL=false
set res="http://registry.npmjs.org/"
set proxy=127.0.0.1:8123

:begin


echo ����SSL��������״̬��%useSSL%
call npm config set strict-ssl %useSSL%

echo ����npmԶ�̿��ַ��%res%
call npm config set registry %res%


echo ����npm�����������ַ��http://%proxy%
call npm config set proxy=http://%proxy%


echo ����ȫ��ģ��Ŀ¼��%gPath%
call npm config set prefix %gPath%


echo --------------------
call npm config ls


:exit
echo �������
pause