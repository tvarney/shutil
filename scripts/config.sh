#!/bin/bash
# -*- sh -*- #

##
# TODO: Move this to ls.sh
# BSD LSCOLORS format
#export LSCOLORS=gxfxcxdxbxegedabagacad

export SHUTILS="${HOME}/.shutils"
export PATH="${PATH}:${SHUTILS}/bin"

export CLEAN="*~ .*~ #* .#* *.tmp, *.temp"
export CLEAN_ASK="True"

export SRC_AUTHOR=""
export SRC_COMPANY=${SRC_AUTHOR}
export SRC_EMAIL=""
export SRC_DATEFMT="%A, %B %d, %Y"

source "${SHUTILS}/colors.sh"
source "${SHUTILS}/goto.sh"
source "${SHUTILS}/setprompts.sh"
source "${SHUTILS}/up.sh"
source "${SHUTILS}/welcome.sh"

