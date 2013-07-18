@echo off
cls
REM ---- Example 1: Translate name of month into two digit number ----
SET v=Mai

SET map=Jan-01;Feb-02;Mar-03;Apr-04;Mai-05;Jun-06;Jul-07;Aug-08;Sep-09;Oct-10;Nov-11;Dec-12
CALL SET v=%%map:*%v%-=%%
SET v=%v:;=&rem.%

ECHO.%v%

REM ---- Example 2: Translate abbreviation into full string ----
SET v=sun

set map=mon-Monday;tue-Tuesday;wed-Wednesday;thu-Thursday;fri-Friday;sat-Saturday;sun-Sunday
CALL SET v=%%map:*%v%-=%%
SET v=%v:;=&rem.%

  ECHO.%v%