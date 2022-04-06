@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2022-04-06

ECHO http://www.codeforge.com/read/48286/%E4%BD%BF%E7%94%A8WMI%E5%88%AB%E5%90%8D%E8%8E%B7%E5%8F%96CPU%E4%BF%A1%E6%81%AF.bat__html
ECHO:
ECHO 'baseboard list brief'
WMIC baseboard list brief
ECHO:
ECHO 'wmic cpu list full'
WMIC cpu list full
ECHO:
ECHO 'wmic bios list brief'
WMIC bios list brief

PAUSE