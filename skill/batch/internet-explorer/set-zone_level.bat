@ECHO OFF
SETLOCAL EnableDelayedExpansion


ECHO set 1001 Download signed ActiveX controls
ECHO set 1004 Download unsigned ActiveX controls
ECHO set 1200 runs ActiveX controls and plug-insECHO:
ECHO set 1201 Initialize and script ActiveX controls not marked as safe
ECHO set 1405 Script ActiveX controls marked safe for scripting
ECHO set 1406 Accessing data sources through domains
ECHO set 1607 Cross-Domain Browsing Subframes
ECHO set 2200 file download automatic prompt **
ECHO set 2201 ActiveX Control Auto Prompt **

REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1001 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1004 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1200 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1201 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1405 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1406 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1607 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 2200 /t REG_DWORD /d 00000000 /f
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 2201 /t REG_DWORD /d 00000000 /f

ECHO:
ECHO set current level to customize
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v CurrentLevel /t REG_DWORD /d 00000000 /f


PAUSE