@REM copy and rename Yu Yu Hakusho *.mp4
@REM usage: rename_yuyu.bat "destination_path" "extension" "file_name"
@REM example: rename_yuyu.bat "tmp" "txt" "tmp.txt"
@REM for %i in (*.txt) do echo %i >> tmp.txt
@echo off
cls

setlocal ENABLEDELAYEDEXPANSION
if "%1"=="" goto createTmp
set dst=%1
if "%2"=="" goto defineExt
set ext=%2
if "%3"=="" goto noFile
set filename=%3
goto hasFile

:: Create folder tmp if destination_path is not defined
:createTmp
set dst=tmp
if exist tmp goto defineExt
mkdir tmp

:defineExt
set ext=txt
:defineFile
set filename=tmp.txt


REM Get the string of file type txt, concatenate by ;
:: no file input, loop through the current directory
:noFile
set teststring=
for %%f in (*.%ext%) do (
	set teststring=!teststring!;%%f
)
goto processteststring

:: with file input, get information from the file
:hasFile
echo %filename%
set filename=%filename:"=%
echo %filename%
set teststring=
for /f "delims=;" %%f in (%filename%) do (
	set teststring=!teststring!;%%f
)
echo teststring=!teststring!

:processteststring
REM Set a string with an arbitrary number of substrings separated by semi colons
REM Remove the first character--;
set teststring=!teststring:~1!
set grapstring=
set continue=y

REM Do something with each substring
:stringLOOP
    REM Stop when the string is empty
    if "!teststring!" EQU "" goto END

    for /f "delims=;" %%a in ("!teststring!") do set substring=%%a

        REM Do something with the substring - 
        REM we just echo it for the purposes of demo
        echo !substring!
	set src=!substring!

REM Now strip off the leading substring
:striploop

    set stripchar=!teststring:~0,1!
    set teststring=!teststring:~1!

    if "!teststring!" EQU "" goto stringloop
    if "!stripchar!" EQU "0" goto nostrip
    if "!stripchar!" EQU "1" goto nostrip
    if "!stripchar!" EQU "2" goto nostrip
    if "!stripchar!" EQU "3" goto nostrip
    if "!stripchar!" EQU "4" goto nostrip
    if "!stripchar!" EQU "5" goto nostrip
    if "!stripchar!" EQU "6" goto nostrip
    if "!stripchar!" EQU "7" goto nostrip
    if "!stripchar!" EQU "8" goto nostrip
    if "!stripchar!" EQU "9" goto nostrip
if "!grapstring!" EQU "" goto noprintgrapstring
if "!continue!" NEQ "y" goto reset
    echo !grapstring!

REM get the length of the string
set myvar=!grapstring!
rem compute the length of a string
set #=%myvar%
set length=0
:strlenloop
if defined # (
    rem shorten string by one character
    set #=%#:~1%
    rem increment the string count variable %length%
    set /A length += 1
    rem repeat until string is null
    goto strlenloop
)

REM add leading zero(one zero for 2 digits, two zero for 1 digit)
	if "%length%" EQU "1" set grapstring=00!grapstring!
	if "%length%" EQU "2" set grapstring=0!grapstring!
    echo !grapstring!

REM    copy "%src%" "!grapstring!.%ext%"
:reset
    set continue=n
    set grapstring=
:noprintgrapstring
    if "!stripchar!" NEQ ";" goto striploop
    set continue=y
    goto stringloop
:nostrip
    set grapstring=!grapstring!!stripchar!
    goto striploop



:END
REM for last token
endlocal