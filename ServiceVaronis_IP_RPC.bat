@echo off
cls
echo Welcome 
echo Check a server for "Varonis service"
echo Run this file when "RPC in unavailable" for services in a server
echo When "RPC in unavailable" you need enter IP Address instead of server name
echo.
echo ---------------------------------------
echo.
@REM if not exist X: net use X: \\XYZ\XYZ

Set /p "Servername=Enter Server's IP address: "
IF not EXIST temp ( mkdir temp )&&( echo Temp folder created successfully. )
echo ---------------------------------------
echo.
echo "Varonis service status"
echo.
set "list=SERVICE_NAME STATE"
set SRV_list=
(For %%A In (%list%) Do (PsService \\%Servername% query VrnsCifsQueue|FindStr /MI %%A))
(For %%A In (%list%) Do (PsService \\%Servername% query VrnsMon|FindStr /MI %%A))
(For %%A In (%list%) Do (PsService \\%Servername% query VrnsSvcFwMon|FindStr /MI %%A))
(For %%A In (%list%) Do (PsService \\%Servername% query VrnsSvcFW|FindStr /MI %%A))

echo.
echo ---------------------------------------
echo.
echo Done!