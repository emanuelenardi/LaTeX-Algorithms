@echo off

call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo: & echo ==================== COMPILO DOCUMENTO PRINCIPALE ==================== & echo:
cd %SRC_DIR%
arara -v main

cd %BUILD_DIR%
@REM rmdir /q /s _minted-cache >nul 2>&1
del /s *.aux >nul 2>&1
del /s *.loa >nul 2>&1
del /s *.loe >nul 2>&1
del /s *.lof >nul 2>&1
del /s *.log >nul 2>&1
del /s *.lot >nul 2>&1
del /s *.synctex(busy) >nul 2>&1
del /s *.synctex.gz >nul 2>&1
del /s *.toc >nul 2>&1

cd %INITIAL_WORKING_DIRECTORY%