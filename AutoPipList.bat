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
pip install pygame
pip install Pycharm
pip install Django
pip install numpy
pip install pandas
pip install pyOpenSSl
pip install Quandl
pip install sklearn
pip install urllib3

echo complete
pause

 rem e.g.: perl myscript.pl %1 %2 %3 %4 %5 %6 %7 %8 %9
goto :eof