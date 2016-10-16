@echo off
echo 系统安装中，请不要关闭这个窗口
mshta vbscript:msgbox("准备开始设置IE安全级别",64,"设置IE安全级别")(window.close)

echo 1001 下载已签名的 ActiveX 控件
echo 1004 下载未签名的 ActiveX 控件
echo 1200 运行 ActiveX 控件和插件
echo 1201 对没有标记为安全的 ActiveX 控件进行初始化和脚本运行
echo 1405 对标记为可安全执行脚本的 ActiveX 控件执行脚本
echo 1406 通过域访问数据源
::echo 1607 跨域浏览子框架
::echo 2200 文件下载自动提示 **
::echo 2201 ActiveX 控件自动提示 **

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1001 /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1004 /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1200 /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1201 /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1405 /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1406 /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1607 /t REG_DWORD /d 00000000 /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 2200 /t REG_DWORD /d 00000000 /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 2201 /t REG_DWORD /d 00000000 /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v CurrentLevel /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\com"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\baidu.com\www" /v http /t REG_DWORD /d 0x00000002 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\google.com" /v http /t REG_DWORD /d 0x00000002 /f

echo 安装结束!
pause 