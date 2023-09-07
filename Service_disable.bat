@echo off
cls
echo Welcome  
echo Run this file when you want to "disable a Service"
echo ---------------------------------------

:WelcomeMenu
Set /p "ServerName=Enter Server's name: "
echo
echo Press 1 to select "Server" service
echo Press 2 to select "Print Spooler" service 
echo Press 0 to exit
echo
echo ---------------------------------------

:SetServiceName
if %ServiceNum%==1 (SET "ServiceName=Server") else if %ServiceNum%==2 (set "ServiceName=Splooler") else ( echo Bye! && GOTO :EOF)
echo %ServiceName%


:ServiceMenu
echo Press 1 to START %ServiceName% service
echo Press 2 to STOP %ServiceName% service
echo Press 3 to RESTART %ServiceName% service
