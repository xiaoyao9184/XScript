Set WshShell = CreateObject("Wscript.Shell")


WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range-www_XXX_com\",Default
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range-www_XXX_com\http","2","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range-www_XXX_com\:Range","www.XXX.com"

WScript.Echo "add zone trust"