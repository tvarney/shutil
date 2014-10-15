# -*- sh -*- #
##
# File: up.sh
# Author: Troy Varney
# Contact: tvarney@cs.utexas.edu
# Date: Wednesday, October 15, 2014
# Description: Define a shell function to move 'up' a given number of
# directories.
##

##
# Copyright (C) 2014 Troy Varney <tvarney@cs.utexas.edu>
#
# up.sh is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public LIcence as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# up.sh is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# up.sh. If not, see <http://www.gnu.org/licenses/>.
##
up() {
    local updir=""
    for arg in "$@"; do
        updir=""
        if [[ "$arg" =~ ^[0-9]+$ ]]; then
            for i in `seq 1 $arg`; do
                updir="${updir}../"
            done
            cd ${updir}
            echo "pwd: `pwd`"
        else
            echo "Invalid number \"$arg\""
            echo "Usage: "
            echo "    up NUM"
            echo "  where NUM =~ ^[0-9]+$"
        fi
    done
}
