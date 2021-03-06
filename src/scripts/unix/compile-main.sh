#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

MESSAGE="\n==================== COMPILO DOCUMENTO PRINCIPALE ====================" ; simple_blue_echo
cd $SRC_DIR
arara -v main
# pdflatex --shell-escape --output-directory=build main.tex
# cd $BUILD_DIR
# makeindex -s ../settings/index-style.ist main
# cd $SRC_DIR
# pdflatex --shell-escape --output-directory=build main.tex

cd $BUILD_DIR
find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm
rm -r _minted-*

cd $INITIAL_WORKING_DIRECTORY
