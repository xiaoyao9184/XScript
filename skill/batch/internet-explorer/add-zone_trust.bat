@ECHO OFF
SETLOCAL EnableDelayedExpansion

@ECHO OFF
SETLOCAL EnableDelayedExpansion


ECHO domain not work for http://*.com
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\com"
ECHO:
ECHO domain http://*.google.com
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\google.com" /v http /t REG_DWORD /d 0x00000002 /f
ECHO:
ECHO domain https://*.google.com
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\google.com" /v https /t REG_DWORD /d 0x00000002 /f
ECHO:
ECHO domain ftp://*.google.com
REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\google.com" /v "ftp" /t REG_DWORD /d "2" /f
ECHO:
ECHO range 127.0.0.1 with http
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range-127000000001" /v ":Range" /d "127.0.0.1" /t REG_SZ /f
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range-127000000001" /v "http" /d "2" /t REG_DWORD /f


PAUSE 