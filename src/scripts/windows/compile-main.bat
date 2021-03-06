@echo off

call "%~dp0\common.bat"

set INITIAL_WORKING_DIRECTORY=%cd%

echo: & echo ==================== COMPILO DOCUMENTO PRINCIPALE ==================== & echo:
cd %SRC_DIR%
arara -v main
@REM pdflatex --shell-escape --output-directory=build main.tex
@REM cd %BUILD_DIR%
@REM makeindex -s ../settings/index-style.ist main
@REM cd %SRC_DIR%
@REM pdflatex --shell-escape --output-directory=build main.tex

@REM cd %BUILD_DIR%
@REM echo: & echo ===================== EFFETTUO PULIZIA FILE AUX ===================== & echo:
@REM echo [ .aux, .idx, .ilg, .ind, .loa, .loe, .lof, .lol, .lot, .synctex(busy), .synctex.gz, .toc ]
@REM rmdir /q /s _minted-cache >nul 2>&1
@REM del /s *.aux >nul 2>&1
@REM del /s *.idx >nul 2>&1
@REM del /s *.ilg >nul 2>&1
@REM del /s *.ind >nul 2>&1
@REM del /s *.loa >nul 2>&1
@REM del /s *.loe >nul 2>&1
@REM del /s *.lof >nul 2>&1
@REM del /s *.lol >nul 2>&1
@REM del /s *.lot >nul 2>&1
@REM del /s *.synctex(busy) >nul 2>&1
@REM del /s *.synctex.gz >nul 2>&1
@REM del /s *.toc >nul 2>&1

cd %INITIAL_WORKING_DIRECTORY%