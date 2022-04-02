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


echo 设置SSL连接启用状态：%useSSL%
call npm config set strict-ssl %useSSL%

echo 设置npm远程库地址：%res%
call npm config set registry %res%


echo 设置npm代理服务器地址：http://%proxy%
call npm config set proxy=http://%proxy%


echo 设置全局模块目录：%gPath%
call npm config set prefix %gPath%


echo --------------------
call npm config ls


:exit
echo 设置完成
pause