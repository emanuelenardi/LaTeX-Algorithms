@echo off
call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo: & echo ==================== COMPILO SINGOLI CAPITOLI =================== & echo:
cd %CHAPTERS_DIR%
@REM https://stackoverflow.com/a/9429985/6505634
for /F %%x in ('dir /B *.tex') do (
	arara %%x
)

cd %BUILD_DIR%
@REM rmdir /q /s _minted-cache >nul 2>&1
del /s *.aux >nul 2>&1
del /s *.log >nul 2>&1
mkdir chapters
move *.pdf chapters

cd %INITIAL_WORKING_DIRECTORY%
