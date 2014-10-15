##
# File: colors.sh
# Author: Troy Varney
# Contact: tvarney@cs.utexas.edu
# Date: Wednesday, January 26, 2011
# Description: 
##

##
# Copyright (C) 2011 Troy Varney <tvarney@cs.utexas.edu>
# 
# colors.sh is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# colors.sh is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# colors.sh. If not, see <http://www.gnu.org/licenses/>.
##

if [ -n "$(which tput)" ]; then
    I_BLACK=0
    I_RED=1
    I_GREEN=2
    I_YELLOW=3
    I_BLUE=4
    I_PURPLE=5
    I_CYAN=6
    I_GREY=7
    I_WHITE=8
    
    alias setfore='tput setaf'
    alias setback='tput setab'
    
    C_BOLD="$(tput bold)"
    C_NORM="$(tput sgr0)"
    
    C_BLACK="$(setfore $I_BLACK)"
    C_RED="$(setfore $I_RED)"
    C_GREEN="$(setfore $I_GREEN)"
    C_YELLOW="$(setfore $I_YELLOW)"
    C_BLUE="$(setfore $I_BLUE)"
    C_PURPLE="$(setfore $I_PURPLE)"
    C_CYAN="$(setfore $I_CYAN)"
    C_GREY="$(setfore $I_GREY)"
    C_WHITE="$(setfore $I_WHITE)"
    
    B_BLACK="$(setback $I_BLACK)"
    B_RED="$(setback $I_RED)"
    B_GREEN="$(setback $I_GREEN)"
    B_YELLOW="$(setback $I_YELLOW)"
    B_BLUE="$(setback $I_BLUE)"
    B_PURPLE="$(setback $I_PURPLE)"
    B_CYAN="$(setback $I_CYAN)"
    B_GREY="$(setback $I_GREY)"
    B_WHITE="$(setback $I_WHITE)"
    
#export I_BLACK I_RED I_GREEN I_YELLOW I_BLUE I_PURPLE I_CYAN I_GREY I_WHITE
#export C_BLACK C_RED C_GREEN C_YELLOW C_BLUE C_PURPLE C_CYAN C_GREY C_WHITE
#export B_BLACK B_RED B_GREEN B_YELLOW B_BLUE B_PURPLE B_CYAN B_GREY B_WHITE
fi

function randcolor()
{
    number=$RANDOM
    let "number %= 7"
    echo $number
}

alias randfore="setfore $(randcolor)"
alias randback="setback $(randcolor)"
