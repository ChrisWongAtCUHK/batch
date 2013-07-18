@echo off
if "%1" == "" goto usage
if "%2" == "" goto usage

rem get the input start date & time
set tmp=%1
set startDate=%tmp:~0,10%
set startTime=%tmp:~11,5%
echo %startDate%
echo %startTime%

rem get the input end date & time
set tmp=%2
set endDate=%tmp:~0,10%
set endTime=%tmp:~11,5%
echo %endDate%
echo %endTime%

rem TODO:
rem		1. find date & time from a single file, e.g. someCmd D:\tmp\tmp.txt
rem		2. loop through the current directory to list all files including those in subdirectories, like dir /b /s

goto end
:usage
echo %0 startdate-time enddate-time
echo example%: %0 18/07/2013-21%:51 18/07/2013-21%:52
:end
rem example: 
rem findtr.bat 18/07/2013-21:51 18/07/2013-21:52