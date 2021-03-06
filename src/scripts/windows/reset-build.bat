@echo off
call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo ================= CANCELLO CONTENUTO CARTELLA BUILD ==================
cd %BUILD_DIR%

@REM cache algoritmi
rmdir /q /s _minted-cache >nul 2>&1

@REM file compilati + synctex
rmdir /q /s chapters >nul 2>&1
del /s *.synctex.gz >nul 2>&1
del /s *.pdf >nul 2>&1

@REM file intermedi
del /s *.aux >nul 2>&1
del /s *.idx >nul 2>&1
del /s *.loa >nul 2>&1
del /s *.loc >nul 2>&1
del /s *.lof >nul 2>&1
del /s *.log >nul 2>&1
del /s *.lot >nul 2>&1
del /s *.synctex(busy) >nul 2>&1
del /s *.toc >nul 2>&1

cd %INITIAL_WORKING_DIRECTORY%
