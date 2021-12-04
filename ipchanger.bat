@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
REM gives command promt adimistrative privilages 

echo ---------------------------------------------
echo Hides ip constantly changing DNS and static adress
echo ---------------------------------------------

echo *NOTE*, By pressing enter, your ip will be constantly changed every 30 seconds  
echo until program is closed
goto answer

:answer 
set /p _ANS=Continue?-y/n 
if %_ANS%==y goto randomizer
if %_ANS%==n goto exit

:randomizer
SET /A test1=%RANDOM% * 100 / 32768 + 100
REM DO NOT USE "test1" IN ANY OTHER PLACE, IT IS THERE TO ACTIVATE THE OTHER VAIRIABLES!
SET /A test2=%RANDOM% * 10 / 32768 + 2
SET /A test3=%RANDOM% * 100 / 32768 + 254
SET /A test4=%RANDOM% * 100 / 32768 + 100
goto ipchanger

:ipchanger
ipconfig /flushdns
ipconfig /release
netsh interface set interface "Local Area Connection" disable
netsh interface ip set dns "Local Area Connection" static
netsh interface ip set address "Local Area Connection" static
netsh interface ip set address "Local Area Connection* 3" static 192.189.%test2%.%test3% 255.255.255.0 192.168.1.254 
netsh interface ip set dns "Local Area Connection* 3" static 192.168.1.1
timeout 30
goto ipchanger
pause


:exit
echo   ____  __  ____  ____     __  ____  ____ 
echo  (  _ \(  )/ ___)/ ___)   /  \(  __)(  __)
echo   ) __/ )( \___ \\___ \  (  O )) _)  ) _) 
echo  (__)  (__)(____/(____/   \__/(__)  (__)  
timeout 5
exit

REM netsh interface ip set adress name="Local Area Connection* 3" static 192.189.%test2%.%test3% 255.255.55.0 192.168.1.254
REM netsh interface ip set dns name=LAN static 192.168.1.1


