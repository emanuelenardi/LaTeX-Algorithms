@echo off

set INITIAL_WORKING_DIRECTORY=%cd%

call "%~dp0\common.bat"
call "%~dp0\reset-project.bat"
call "%~dp0\compile-preambles.bat"
@REM call "%~dp0\compile-chapters.bat"
call "%~dp0\compile-main.bat"

cd %INITIAL_WORKING_DIRECTORY%