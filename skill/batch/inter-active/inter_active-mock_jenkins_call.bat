@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2018-11-20
::FILE inter_active-mock_jenkins_call
::DESC mock jenkins call inter_active

SET JENKINS_HOME="mock"
CMD /c "inter_active.bat"
ECHO:
ECHO pause by %~nx0
PAUSE
EXIT /b