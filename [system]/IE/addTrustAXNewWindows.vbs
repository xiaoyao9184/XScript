Set WshShell = CreateObject("Wscript.Shell")
'��ӿ���վ���IP
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100\",Default
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100\http","2","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100\:Range","www.XXX.com"
'�޸�IE ActiveX ��ȫ����
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1001","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1004","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1200","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1201","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1405","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\2201","0","REG_DWORD"
'���õ���������ֹ����
WshShell.RegWrite "HKCU\Software\Microsoft\Internet Explorer\New Windows\PopupMgr","no"
WScript.Echo "����վ�����ã�ActiveX �ؼ���ȫ���ã������������óɹ�"