Set WshShell = CreateObject("Wscript.Shell")
'添加可信站点或IP
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100\",Default
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100\http","2","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100\:Range","www.XXX.com"
'修改IE ActiveX 安全设置
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1001","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1004","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1200","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1201","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1405","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\2201","0","REG_DWORD"
'禁用弹出窗口阻止程序
WshShell.RegWrite "HKCU\Software\Microsoft\Internet Explorer\New Windows\PopupMgr","no"
WScript.Echo "可信站点设置，ActiveX 控件安全设置，弹出窗口设置成功"