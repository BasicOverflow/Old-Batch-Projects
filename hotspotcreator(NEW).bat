@echo off

if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload
    echo %~nx0: running payload with parameters:
    echo %*
    echo ---------------------------------------------------
    cd /d %2
    shift
    shift
    rem put your code here
title Hotspot creator
echo.
echo --------------------------------------------------------------------------------
echo Creates additional Network, can be found in network
echo settings after being created
echo.
echo *NOTE*- Not as powerful as reguar network, 
echo so downloading files on newtwork is not recommended
echo --------------------------------------------------------------------------------
echo.

:create
echo Welcome to hotspot creator 
echo Please enter wirless information 
echo.
echo. 
SET /P _name= Please enter network name:
echo.
echo note: Key must be 8 characters or longer!
SET /P _password= Please enter network password:
echo.
echo.
echo network name: %_name%
echo.
echo.
echo passkey: %_password%
echo.
echo.
goto activate

:activate
ipconfig /flushdns
ipconfig /release
netsh wlan set hostednetwork mode=allow ssid=%_name% key=%_password% keyUsage=temporary
goto next

:next
echo.
echo.
echo Press enter to activate wireless hotspot
netsh wlan start hostednetwork
pause

goto :eof






