@REM Give a list of Server names in command line 
@REM And receive the IP addresses in "IP_Address_list.CSV"
@REM echo This batch file find the IP address against Following Domains
@REM echo XYZ.ca

@echo off
cls
echo Welcome 
echo This batch file find the IP address against available Domains
echo.
setlocal EnableDelayedExpansion
echo Acceptable file input formats are myfile.txt AND myfile.csv
echo.
Set /p "FileName=Enter the Servers File Name(0 to Exit): "

IF %FileName%==0 ( echo. && echo Bye! && GOTO :EOF )
IF not EXIST temp ( mkdir temp )&&( echo Temp folder created successfully. )
echo Working on the file ...

( for /F "tokens=*" %%A in (%FileName%) do set Servername=%%A &&(
    set ip=Not found
    
    ( for /f "tokens=2 delims=[]" %%B IN ( 'ping -n 1 %%A.XYZ.ca' ) DO (
        if "%%B" NEQ "request" ( set ip=%%B && set ip_valid=1 )))
            
    ( for /f "tokens=2 delims=[]" %%D IN ( 'ping -n 1 %%A.XYZ2.ca' ) DO (
        if "%%D" NEQ "request" ( set ip=%%D && set ip_valid=1 )))
                    
    ( for /f "tokens=2 delims=[]" %%F IN ( 'ping -n 1 %%A.XYZ3.ca' ) DO (
        if "%%F" NEQ "request" ( set ip=%%F && set ip_valid=1 )))
    
    echo !Servername!, !ip!
)
) > temp\IP_Address_list.csv

echo.
echo Finished successfully.
echo.
echo IP address list is available in temp folder : "IP_Address_list.csv"
