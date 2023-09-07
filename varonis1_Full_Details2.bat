@echo off
cls
echo Welcome 
echo Check a server for MAP drive, Server and Varonis service
echo. 
if not exist X: net use X: \\XYZ\XYZ$
Set /p "Servername=Enter Server name: "
IF %Servername%==0 ( echo. && echo Bye! && GOTO :EOF )
echo.
echo ---------------------------------------
echo "Check server if Exists in Cloud" && echo.
IF EXIST Z:\%Servername% (@echo MAP drive True) else (@echo MAP drive False)
echo ---------------------------------------
echo "LANMAN SERVER service" && echo.
PsService \\%Servername% query LANMANSERVER|FindStr /MI "STATE"
echo ---------------------------------------
echo "Printer (Spooler) service status" && echo.
PsService \\%Servername% query spooler|FindStr /MI "STATE"
echo ---------------------------------------
echo "Varonis service status" && echo.
PsService \\%Servername% query Varonis|FindStr /MI "STATE"
echo ---------------------------------------
echo "Remote share server status" && echo.
RMTSHARE \\%Servername%
echo ---------------------------------------
echo "Ping server"
ping %Servername% -n 1
echo ---------------------------------------
echo "Server info" && echo.
systeminfo /s %Servername%|FIND /i "OS Name"
echo ---------------------------------------
echo.
echo Done!
