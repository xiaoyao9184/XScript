@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2022-04-06

ECHO 'logicaldisk list'
WMIC logicaldisk list
ECHO:
ECHO 'logicaldisk list brief'
WMIC logicaldisk list brief
ECHO:
ECHO DriveType 2:usb,3:hdd,5:cd-rom
WMIC logicaldisk where "DriveType=3" list brief
ECHO:
ECHO 'logicaldisk where * get *'
WMIC logicaldisk where "DriveType=3" get DeviceID,Size,FreeSpace,Description,FileSystem

PAUSE