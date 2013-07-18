::http://stackoverflow.com/questions/1707058/how-to-split-a-string-in-a-windows-batch-file
@echo off
cls
setlocal ENABLEDELAYEDEXPANSION
set/a count=0
REM Set a string with an arbitrary number of substrings separated by semi colons
::set teststring=The,rain,in,spain
set/p teststring=<k-lunch.txt
REM Do something with each substring
:stringLOOP
	REM Stop when the string is empty
	if "!teststring!" EQU "" goto END

	for /f "delims=," %%a in ("!teststring!") do (
		set/a count+=1
		set substring=%%a
	)

        REM Do something with the substring - 
        REM we just echo it for the purposes of demo
	REM trancate the leading spaces
	for /f "tokens=* delims= " %%b in ("!substring!") do set substring=%%b
        echo !substring!

REM Now strip off the leading substring
:striploop
	set stripchar=!teststring:~0,1!
	set teststring=!teststring:~1!

	if "!teststring!" EQU "" goto stringloop

	if "!stripchar!" NEQ "," goto striploop

	goto stringloop


:END
echo.
echo %count%pp will go to k-lunch
endlocal