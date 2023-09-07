@echo off
cls
echo Welcome 
echo Check a server in MAP drive, Server and Varonis service
echo. 
if not exist X: net use X: \\XYZ\XYZ$
Set /p "Servername=Enter Server name: "
IF %Servername%==0 ( echo. && echo Bye! && GOTO :EOF )
echo.
echo ---------------------------------------
echo "Check server if Exists MAP drive" 
IF EXIST Z:\%Servername% (@echo MAP drive True) else (@echo MAP drive False)
echo ---------------------------------------
echo "LANMAN SERVER service"
xnet list \\%Servername%\LANMANSERVER
echo ---------------------------------------
echo "LANMAN SERVER service status"
xnet list \\%Servername%\LANMANSERVER|FIND /i "Service state"&@ECHO %Errorlevel%
echo ---------------------------------------
echo "Varonis service status"
xnet list \\%Servername%|FIND /i "Varonis"
echo ---------------------------------------
echo "Remote share server status"
RMTSHARE \\%Servername%
echo ---------------------------------------
echo "Ping server"
ping %Servername% -n 1
echo ---------------------------------------
echo "Server info"
systeminfo /s %Servername%|FIND /i "OS Name"
echo ---------------------------------------
echo Done!
