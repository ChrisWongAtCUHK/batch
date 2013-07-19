@echo off
rem http://stackoverflow.com/questions/11210997/dos-date-math
set /a DAYS=%1
call dateToJulian %date%
set /a newDate=JDN+DAYS
call julianToDate %newDate%