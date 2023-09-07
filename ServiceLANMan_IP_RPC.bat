@echo off
cls
echo Welcome 
echo Check a server for "Server service Or LANMAN"
echo Run this file when "RPC in unavailable" for services in a server
echo When "RPC in unavailable" you need to enter IP Address instead of server name
echo.
echo ---------------------------------------
echo.
@REM if not exist X: net use X: \\XYZ\XYZ
Set /p "Servername=Enter Server's Name OR IP address: "
IF not EXIST temp ( mkdir temp )&&( echo Temp folder created successfully. )

set "list2=SERVICE_NAME STATE"
(For %%B In (%list2%) Do (PsService \\%Servername% query LANMANSERVER|FindStr /MI %%B))

echo.
echo ---------------------------------------
echo.
echo Done!