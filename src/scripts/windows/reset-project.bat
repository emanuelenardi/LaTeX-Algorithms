@echo off
call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo: & echo =========== CANCELLO IL PREAMBOLO PRE-COMPILATO DEL MAIN =============
cd %SETTINGS_DIR%
del /s preamble.main.fmt >nul 2>&1

echo ============== CANCELLO LOG E PREAMBOLO DEGLI ALGORITMI ==============
cd %ALGORITHMS_DIR%
del /s preamble.fmt >nul 2>&1

echo ================= CANCELLO CONTENUTO CARTELLA BUILD ==================
cd %BUILD_DIR%
@REM rmdir /q /s _minted-cache >nul 2>&1
rmdir /q /s chapters >nul 2>&1
del /s *.aux >nul 2>&1
del /s *.log >nul 2>&1
del /s *.pdf >nul 2>&1

cd %INITIAL_WORKING_DIRECTORY%
