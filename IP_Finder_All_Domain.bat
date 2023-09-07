@REM Give Server name in command line and get the IP address 
@echo off
cls
echo Welcome 
echo This batch file find the IP address against Normal and XYZ Domain
setlocal EnableDelayedExpansion
echo.
Set /p "myServer=Enter the Server Name (0 to exit): "
IF %myServer%==0 ( echo. && echo Bye! && GOTO :EOF )

for /f "tokens=1,2 delims=[]" %%c IN ('ping -n 1 !myServer!') DO (
    if "%%d" NEQ "" set ip1=%%d 
    )

for /f "tokens=1,2 delims=[]" %%e IN ('ping -n 1 !myServer!.XYZ.ca') DO (
    if "%%f" NEQ "" set ip2=%%f 
    )

for /f "tokens=1,2 delims=[]" %%g IN ('ping -n 1 !myServer!.XYZ2.ca') DO (
    if "%%h" NEQ "" set ip3=%%h
    )

echo.
@REM This will check if the result from ip1 or ip2 or ip3 is empty or not 
@REM and will provide proper respond to the query
( if not "%ip1%" == "" ( echo IP exists in XYZ, XYZ3, ...: %ip1% ) else (
   ( if not "%ip2%" == "" ( echo IP exists in XYZ2: %ip2%) else (
        ( if not "%ip3%" == "" ( echo IP exists in XYZ4 Domain: %ip3%) else ( 
             echo There is no DNS record for the server name. ))))))
