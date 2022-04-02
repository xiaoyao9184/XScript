Set WshShell = CreateObject("Wscript.Shell")

WScript.Echo "set 1001 Download signed ActiveX controls"
WScript.Echo "set 1004 Download unsigned ActiveX controls"
WScript.Echo "set 1200 runs ActiveX controls and plug-ins"
WScript.Echo "set 1201 Initialize and script ActiveX controls not marked as safe"
WScript.Echo "set 1405 Script ActiveX controls marked safe for scripting"
WScript.Echo "set 1406 Accessing data sources through domains"
WScript.Echo "set 1607 Cross-Domain Browsing Subframes"
WScript.Echo "set 2200 file download automatic prompt **"
WScript.Echo "set 2201 ActiveX Control Auto Prompt **"

WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1001","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1004","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1200","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1201","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1405","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1406","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\1607","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\2200","0","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2\2201","0","REG_DWORD"


WScript.Echo "set popup massage box"
WshShell.RegWrite "HKCU\Software\Microsoft\Internet Explorer\New Windows\PopupMgr","no"
