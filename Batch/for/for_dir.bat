@echo off
::https://bbs.et8.net/bbs/showthread.php?t=1035406

echo ==========DIR 显示==========
dir /a %~dp0*.*
pause

echo ==========DIR 显示文件名称==========
dir /b %~dp0*.*
pause

echo ==========FOR 语句配合 DIR 仅仅显示文件名称==========
for /f %%A in ('dir /b %~dp0*.*') do echo %%~nA
pause

echo ==========FOR 语句配合 DIR 显示文件名称 文件属性==========
FOR /f %%i in ('dir /b %~dp0*.*') do (
	echo %%i
	echo %%~ai
)
pause

echo ==========FOR 语句配合 DIR 显示文件信息==========
for /f %%i in ('dir /b %~dp0*.*') do (
	echo %%i
		
	rem 将 %I 扩充到一个完全合格的路径名
	echo %%~fi
	
	rem 扩充到一个驱动器号
	echo %%~di
	
	rem 扩充到一个路径
	echo %%~pi
	
	rem 扩充到一个文件名
	echo %%~ni
	
	rem 扩充到一个文件扩展名
	echo %%~xi
	
	rem 扩充的路径只含有短名
	echo %%~si
	
	rem 扩充到文件的文件属性
	echo %%~ai
	 
	rem 扩充到文件的日期/时间
	echo %%~ti 
	
	rem 扩充到文件的大小
	echo %%~zi
	
	echo ---------------------------------------------------
)
pause