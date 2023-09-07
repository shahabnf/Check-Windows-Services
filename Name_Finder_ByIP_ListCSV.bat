@REM Give Server name in command line and get the IP address 
@echo off
cls
setlocal EnableDelayedExpansion
echo Welcome 
echo Get the "Server Name" from IP address 
echo Acceptable file input formats are myfile.txt AND myfile.csv
echo.
@REM set FileName=ServerList.txt
Set /p "FileName=Enter the Servers File Name (0 to exit): "
echo.
IF %FileName%==0 ( echo Bye! && GOTO :EOF)

echo Working on the file ...
( for /f "tokens=*" %%A IN (%FileName%) DO set myServerIP=%%A &&(
    ( for /f "tokens=2,3 delims= " %%E IN ('ping -a -n 1 !myServerIP!') DO (
        if "%%F" EQU "[%%A]" ( echo %%A, %%E )
            )))) > temp\NameFinder_csv.csv
            @REM 2> temp\nameFinder_fail.txt

echo.
echo Finished successfully.
echo.
echo IP address list is available in temp folder : "NameFinder_csv.csv"