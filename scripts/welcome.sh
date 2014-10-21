#!/bin/bash
# -*- sh -*-
##
# File: welcome.sh
# Author: Troy Varney
# Contact: tvarney@cs.utexas.edu
# Date: Wednesday, October 15, 2014
# Description: Define shell function to print welcome message.
##

##
# Copyright (C) 2014 Troy Varney <tvarney@cs.utexas.edu>
#
# welcome.sh is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public LIcence as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# welcome.sh is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# welcome.sh. If not, see <http://www.gnu.org/licenses/>.
##
welcome() {
    echo
    echo -e "${C_NORM}${C_BOLD}${C_CYAN}Welcome to ${C_RED}BASH ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}.${BASH_VERSINFO[2]}[${BASH_VERSINFO[3]}]${C_CYAN}!${C_GREEN}"
    date
    
    if [ -n `which fortune` ]; then
        echo -e "${C_BLUE}`fortune`"
    fi
    tput sgr0
}
