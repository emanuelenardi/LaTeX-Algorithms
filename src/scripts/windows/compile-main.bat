@echo off

call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo: & echo ==================== COMPILO DOCUMENTO PRINCIPALE ==================== & echo:
cd %SRC_DIR%
@REM arara -v main

cd %BUILD_DIR%
echo: & echo ===================== EFFETTUO PULIZIA FILE AUX ===================== & echo:
rmdir /q /s _minted-cache >nul 2>&1
@REM Delete all files EXCEPT a given extension
for /f %%F in ('dir /b /a-d ^| findstr /vile ".gitignore .pdf"') do del "%%F"

cd %INITIAL_WORKING_DIRECTORY%