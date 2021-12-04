@echo off

:calc
set /p MATH=Equation?
echo %MATH%
set /a RESULT=%MATH%
echo %RESULT%
if %RESULT%==5 start notepad.exe
pause
cls
goto calc 
pause