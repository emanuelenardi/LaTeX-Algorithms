#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

chapters_tex=$(ls -A $CHAPTER_DIR | wc -l)
chapters_pdf=$(ls -A $BUILD_DIR/chapters | wc -l)

echo "number of chapters:     $chapters_tex"
echo "number of pdf compiled: $chapters_pdf"
[[ -f main.pdf ]] && echo '"main.pdf" exist' || echo '"main.pdf" does not exist'

isCompilationRanCorrectly() {
  if [ $chapters_pdf -eq $chapters_tex ] && [ -f $BUILD_DIR/main.pdf ]; then
      exit 0 # success
  else
      exit 1 # failure
  fi
}