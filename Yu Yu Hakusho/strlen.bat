REM http://www.psteiner.com/2010/09/compute-length-of-string-in-batch-file.html
@echo off
cls
set myvar="Chris Wong is handsome string"
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
echo myvar is %length% characters long!