@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2022-04-06


ECHO https://www.processlibrary.com/en/directory/files/igfxpph/309086/
ECHO Unregister Register Server igfxpph.dll 
REGSVR32 /u igfxpph.dll 
ECHO:
ECHO ReCreate Register value
REG delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers /f 
REG add HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\New /ve /d {D969A300-E7FF-11d0-A93B-00A0C90F2719}


PAUSE