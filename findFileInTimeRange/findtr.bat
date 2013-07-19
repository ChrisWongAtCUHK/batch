@echo off

if "%1" == "" goto usage
if "%2" == "" goto usage

rem get the path to be find
set findPath=%1

rem get the input start date & time
set tmp=%2
set startDate=%tmp:~0,10%

call dateToJulian %startDate%
set startDateDayNum=%JDN%

rem get the input end date & time
set tmp=%3
set endDate=%tmp:~0,10%
call dateToJulian %endDate%
set endDateDayNum=%JDN%

rem TODO:
rem		1. find date & time from a single file, e.g. someCmd D:\tmp\tmp.txt
rem		2. loop through the current directory to list all files including those in subdirectories, like dir /b /s
setlocal ENABLEDELAYEDEXPANSION

rem loop through the files including those in subdirectories
for /F "tokens=1-5 delims=" %%a in ('dir /s %findPath%') do ( 
	set line=%%a
	set volCheck=!line:~1,6!
	 if "!volCheck!" neq "Volume" (
		
		set dirCheck=!line:~1,9!
		if "!dirCheck!" equ "Directory" (
			set directory=!line:~14!
		) else (
			set fileDate=!line:~0,10!
			set fileTime=!line:~12,8!
			set fileName=!line:~36!
			set line2=!line:~2,1!
			set line5=!line:~5,1!

			if "!line2!" equ "/" (
				if "!line5!" equ "/" (
					call dateToJulian !fileDate!
::				echo %startDateDayNum%, %endDateDayNum%, !fileDate!, !fileTime!, !fileName!, !JDN!
					if !JDN! geq %startDateDayNum% (
						if !JDN! leq %endDateDayNum% (
							if "!fileTime!" neq "." (
								if "!fileTime!" neq ".." (
									echo !fileDate!     !fileTime!     !directory!\!fileName!
								)
							)
						)
					)
				)
			)
		)
	 )
)

endlocal

goto end
:usage
echo %0 startDate endDate
echo example%: %0 18/07/2013 18/07/2013
:end
rem example: 
rem findtr.bat D:\github\batch\dostips\DtTipsDateTime 02/07/2013 03/07/2013

 