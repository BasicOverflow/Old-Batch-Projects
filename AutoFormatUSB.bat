@echo off

echo First, hold down windows key + r and type cmd
echo.
echo Then type 'diskpart' >>>> 'list disk'
pause
set /input = 'Type in disk number (WARNING: DO NOT PUT WRONG NUMBER OR SUFFER THE CONSEQUENCES):'
cls
echo Formating...

Diskpart

list disk
select disk input
detail disk

clean

create partition extended

create partition logical

exit
