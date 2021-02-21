#!/bin/bash

INITIAL_WORKING_DIRECTORY=$(pwd)

source "src/scripts/unix/common.sh"

# GITHUB_ACTIONS: Always set to true when GitHub Actions is running the workflow.
# You can use this variable to differentiate when tests are being run locally or by GitHub Actions.
if [[ -z "${GITHUB_ACTIONS}" ]] ; then
  source "src/scripts/unix/reset-project.sh"
else
  : # no-op command
fi

source "src/scripts/unix/compile-preambles.sh"
source "src/scripts/unix/compile-chapters.sh"
source "src/scripts/unix/compile-main.sh"

cd $INITIAL_WORKING_DIRECTORY