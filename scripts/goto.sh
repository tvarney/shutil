# -*- sh -*- #
##
# File: goto.sh
# Author: Troy Varney
# Contact: tvarney@cs.utexas.edu
# Date: Wednesday, October 15, 2014
# Description: 
##

##
# Copyright (C) 2014 Troy Varney <tvarney@cs.utexas.edu>
#
# goto.sh is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public LIcence as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# goto.sh is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# goto.sh. If not, see <http://www.gnu.org/licenses/>.
##
_goto_put() {
    local found=
    local re='^'$1'='
    while read -r; do
        if [[ "$REPLY" =~ $re ]]; then
            echo "$1=$2"
            found="YES"
        else
            echo "${REPLY}"
        fi
    done
    if [[ -z "$found" ]]; then
        echo "$1=$2"
    fi
    return 0
}

_goto_remove() {
    local re='^'$1'='
    local line=
    local found=
    while read -r; do
        if ! [[ "${REPLY}" =~ $re ]]; then
            echo $REPLY
        else
            found=YES
        fi
    done
    if [[ -z "$found" ]]; then
        return 0
    else
        return 1
    fi
}

_goto_get() {
    local re='^'$1'='
    local line=
    while read -r; do
        line=$REPLY
        if [[ "${line}" =~ $re ]]; then
            echo `echo ${line} | cut -f 2 -d '='`
            return 0
        fi
    done
    return 0
}

_goto_usage() {
    echo "Usage: goto [help|list|check|save|add|forget|del|rm] ARGS..."
    echo ""
    echo "  help"
    echo "    Prints this message and exits"
    echo "  list"
    echo "    Lists all saved target names"
    echo "  check NAME"
    echo "    Prints the target destination if the target name exists"
    echo "  save|add NAME"
    echo "    Adds the current directory to the list of saved targets."
    echo "    If the target already exists, it is overwritten."
    echo "  forget|del|rm NAME"
    echo "    Removes the target given by $NAME from the list of saved targets."
    return 1
}

goto() {
    # Make sure goto exists
    if ! [[ -f "${HOME}/.goto" ]]; then > "${HOME}/.goto"; fi
    local errs=
    # Parse our arguments
    while [[ -n "$1" ]]; do
        case $1 in
            help)
                _goto_usage
                return 1
                ;;
            list)
                echo "goto targets:"
                for target in `cat "${HOME}/.goto" | cut -f 1 -d '='`; do
                    echo "  $target"
                done
                shift
                ;;
            check)
                if [[ -z $2 ]]; then
                    echo "Error: 'goto check' requires a target name"
                    _goto_usage
                    return $?
                fi
                
                local target=`_goto_get "$2" < ~/.goto`
                if [[ -z "$target" ]]; then
                    echo "No target \"$target\" exists"
                else
                    echo "$2 -> $target"
                fi
                shift
                shift
                ;;
            save|add)
                if [[ -z $2 ]]; then
                    echo "Error: 'goto save' requires a target name"
                    _goto_usage
                    return $?
                fi
                case "$2" in
                    save|add|forget|del|rm)
                        echo "Invalid target name"
                        echo "target name cannot be one of save, add, forget, del, or rm"
                        _goto_usage
                        return 1
                esac
                
                _goto_put $2 `pwd` < "${HOME}/.goto" > "${HOME}/.goto.out"
                if [[ $? ]]; then
                    mv "${HOME}/.goto.out" "${HOME}/.goto"
                else
                    echo "Error saving current directory as $2"
                    rm -f "${HOME}/.goto.out"
                fi
                shift
                shift
                ;;
            forget|del|rm)
                if [[ -z $2 ]]; then
                    echo "Error: 'goto forget' requires a target name"
                    _goto_usage
                    return 1
                fi
                
                _goto_remove $2 < "${HOME}/.goto" > "${HOME}/.goto.out"
                if [[ $? ]]; then
                    mv "${HOME}/.goto.out" "${HOME}/.goto"
                else
                    echo "Error removing \"$2\" from target list"
                    _goto_usage
                    return 1
                fi
                shift
                shift
                ;;
            *)
                local target=`_goto_get $1 < ${HOME}/.goto`
                if [[ -z "$target" ]]; then
                    echo "Error: Invalid target name"
                    _goto_usage
                    return 1
                fi
                if [[ "`pwd`/" != "$target" ]]; then
                    if [[ -n "$GOTO_PUSH" ]]; then
                        pushd "$target"
                    else
                        cd "$target"
                    fi
                fi
                shift
                ;;
        esac
    done
}
