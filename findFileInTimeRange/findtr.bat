@echo off
if "%1" == "" goto usage
if "%2" == "" goto usage
echo %1
echo %2

goto end
:usage
echo %0 startdate-time enddate-time
echo example%: %0 18/07/2013-21%:51 18/07/2013-21%:52
:end
rem example: 
rem findtr.bat 18/07/2013-21:51 18/07/2013-21:52