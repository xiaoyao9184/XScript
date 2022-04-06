@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2022-04-06

ECHO http://www.windows-commandline.com/wmic-useraccounts/

::all
WMIC useraccount list brief

::lock
WMIC useraccount where name='Administrator' set disabled=false
WMIC useraccount where name='Administrator' set disabled=true

PAUSE