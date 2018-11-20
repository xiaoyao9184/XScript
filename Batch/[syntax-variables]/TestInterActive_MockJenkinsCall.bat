@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2018-11-20
::FILE TestInterActive[MockJenkinsCall]
::DESC mock jenkins call TestInterActive

set JENKINS_HOME="mock"
cmd /c "TestInterActive.bat"

pause
exit 1