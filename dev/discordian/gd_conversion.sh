#!/bin/bash -
#
# SCRIPT: gd_conversion.sh
# AUTHOR: Luciano D. Cecere
# DATE: 06/17/2015-11:08:47 AM
########################################################################
#
# gd_conversion.sh - Generate conversion chart
# Copyright (C) 2015 Luciano D. Cecere <ldante86@aol.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
########################################################################

export PATH=/bin:/usr/bin
unalias -a

_print_discordian_year()
{
    [ $l -gt 0 ] || l=0

    for i in {1..73}
    do
      [ $l -eq 5 ] && l=0 && printf "\n"
      if [ $i -lt 10 ]; then
        if [ $i -eq 1 ]; then
          echo -n " ${SEASONS[s++]}  $i"
        elif [ $i -eq 5 ]; then
          echo -n "     *$i"
        else
          echo -n "      $i"
        fi
      elif [ $i -eq 50 ]; then
        echo -n "    *$i"
      else
        echo -n "     $i"
      fi
      ((++l))
    done
}

_print_gregorian_year()
{
    [ $l -gt 0 ] || l=0

    for ((i=1; i<=${MONTH_LEN[$1-1]}; i++))
    do
      [ $l -eq 5 ] && l=0 && printf "\n"
      if [ $i -lt 10 ]; then
        if [ $i -eq 1 ]; then
          echo -n " ${MONTHS[s++]}  $i"
        else
          echo -n "      $i"
        fi
      else
        echo -n "     $i"
      fi
      ((++l))
    done
}

_main()
{
    if [ $(tput cols) -lt 77 ]; then
      echo The terminal is too small. This chart requires a terminal with
      echo at least 77 columns wide in order to view it properly.
      exit 1
    fi

    gyear=/tmp/gyear.$$
    dyear=/tmp/dyear.$$
    convert=gd_chart.txt

    SEASONS=(Chs Dsc Cfn Bcy Afm)
    MONTHS=(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    MONTH_LEN=(31 28 31 30 31 30 31 31 30 31 30 31)

    l=0 s=0
    for n in {1..5}
    do
      _print_discordian_year
    done > $dyear

    l=0 s=0
    for n in {1..12}
    do
      _print_gregorian_year $n
    done > $gyear

    >$convert
    printf "\n\t\tGregorian\t\t\t\tDiscordian\n\n" >> $convert
    printf "\t\t\t\t\t     SM     BT     PD     PP     SO\n" >> $convert
    printf "    ------- ------- ------- -------\t" >> $convert
    printf "    ------- ------- ------- -------\n" >> $convert

    paste $gyear $dyear >> $convert
    less $convert
    rm $gyear $dyear
    rm $convert
}

_main
