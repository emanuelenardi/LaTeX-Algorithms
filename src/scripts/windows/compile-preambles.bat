@echo off
call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo: & echo ==================== COMPILO PREAMBOLO PRINCIPALE ==================== & echo:
cd "%SETTINGS_DIR%"
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
del /s preamble.main.log >nul 2>&1

echo: & echo ==================== COMPILO PREAMBOLO ALGORITMI ==================== & echo:
cd "%ALGORITHMS_DIR%"
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
del /s preamble.log >nul 2>&1
cls

cd %INITIAL_WORKING_DIRECTORY%