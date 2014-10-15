#!/bin/bash
##
# File: setprompts.sh
# Author: Troy Varney
# Contact: tvarney@cs.utexas.edu
# Date: Wednesday, October 15, 2014
# Description: 
##

##
# Copyright (C) 2014 Troy Varney <tvarney@cs.utexas.edu>
#
# setprompts.sh is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public LIcence as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# setprompts.sh is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
# 
# You should have received a copy of the GNU General Public License along with
# setprompts.sh. If not, see <http://www.gnu.org/licenses/>.
##
function setprompts()
{
    # All colors with _f attached are foreground modifiers
    # All colors with _b attached are background modifiers
    local red_f="\[$(tput setaf 1)\]"
    local red_b="\[$(tput setab 1)\]"
    local green_f="\[$(tput setaf 2)\]"
    local green_b="\[$(tput setab 2)\]"
    local yellow_f="\[$(tput setaf 3)\]"
    local yellow_b="\[$(tput setab 3)\]"
    local blue_f="\[$(tput setaf 4)\]"
    local blue_b="\[$(tput setab 4)\]"
    local purple_f="\[$(tput setaf 5)\]"
    local purple_b="\[$(tput setab 5)\]"
    local cyan_f="\[$(tput setaf 6)\]"
    local cyan_b="\[$(tput setab 6)\]"
    
    # norm resets ALL settings, including color and formatting.
    local norm="\[$(tput sgr0)\]"
    local bold="\[$(tput bold)\]"
    local uline="\[$(tput smul)\]"
    local blink="\[$(tput blink)\]"
    local inverse="\[$(tput smso)\]"
    
#######################################################################
## Change this section to change colors used in prompts
    
    # Color used for the host
    local hostcolor="${bold}${green_f}"
    # Color used for the date
    local datecolor="${bold}${yellow_f}"
    # Color used for the path
    local pathcolor="${bold}${cyan_f}"
    # Color used for normal and root users
    local usercolor_norm="${bold}${cyan_f}"
    local usercolor_root="${bold}${red_f}"
    # Color used for version numbers.
    local verscolor=""
    
    # User color, determined by EUID
    usercolor=""
    case "$EUID" in
	0) # You are root
            usercolor="$usercolor_root"
            ;;
	*) # You are not
            usercolor="$usercolor_norm"
            ;;
    esac
    
#######################################################################
    
    # Possible Path representations
    local path_full="${pathcolor}\w${norm}"
    local path_trunc="${pathcolor}\W${norm}"
    
    # Hostnames
    local host_full="${hostcolor}\H${norm}"
    local host_trunc="${hostcolor}\h${norm}"
    
    # Username
    local user="${usercolor}\u${norm}"
    
    # Dates and Times
    # The time in the "Weekday Month Day" format
    local def_date="${datecolor}\d${norm}"
    # Custom time representation
    local fmt_date="${datecolor}\D{${DATE_FMT}}${norm}"
    # Time in the 24 hour format "HH:MM:SS"
    local time_24a="${datecolor}\t${norm}"
    # Time in the 24 hour format "HH:MM"
    local time_24b="${datecolor}\A${norm}"
    # Time in the 12 hour format "HH:MM:SS". No am/pm
    local time_12a="${datecolor}\T${norm}"
    # Time in the 12 hour format "HH:MM AM/PM"
    local time_12b="${datecolor}\@${norm}"
    
    # Bash Versions
    local version="${verscolor}\v${norm}"
    local release="${verscolor}\V${norm}"
    
    # An audible bell
    local bell="\a"
    # A backslash
    local bs="\\"
    # Generic escape sequence
    local escape="\e"
    # The history number of this command
    local hist="\!"
    # The number of this command in the current shell
    local num="\#"
    # # if UID is 0 (root), otherwise $
    local end="\$"
    # The current number of jobs managed by this shell
    local jobs="\j"
    # The name of the shell
    local shell="\s"
    # Basename of the tty
    local tty="\l"
    
    # Always set to defaults "${norm}" at the start of each prompt.
    # PS1 - The default prompt
    export PS1="${norm}[${user}@${host_trunc}]: ${path_trunc}${end} "
    #PS1="${norm}${user}@${host_trunc} ${date_24a}${end} "
    #PS1="${norm}${user}@${host_trunc} ${end} "
    
    # PS2 - continuation prompt
    export PS2="${norm}... "
    #PS2="${norm}${red}>>>${norm} "
    #PS2="${norm}! "
}

setprompts
