#!/bin/bash -
#
# SCRIPT: dcal.sh
# AUTHOR: Luciano D. Cecere
# DATE: 06/21/2015-04:44:01 PM
########################################################################
#
# dcal.sh - Generate Discordian Calendar
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
PROGRAM="${0##*/}"

WEEKDAY=(Sweetmorn Boomtime Pungenday Prickle-Prickle "Setting Orange")
APOSTLE=(Mungday Mojoday Syaday Zaraday Maladay)
HOLYDAY=(Chaoflux Discoflux Confuflux Bureflux Afflux)
SEASONS=(Chaos Discord Confusion Bureaucracy "The Aftermath")

TIB=0

month_len()
{
    case $1 in
      4|6|9|11        )  echo 30 ;;
      1|3|5|7|8|10|12 )  echo 31 ;;
      2)
        if [[ $(($2 % 4)) -eq 0 && $(($2 % 100)) -ne 0 || $(($2 % 400)) -eq 0 ]]; then
          echo 29
        else
          echo 28
        fi
        ;;
    esac
}

ordinal()
{
    case ${1:$((${#1}-2)):2} in
      [2-9][1]|1  )  echo ${1}st ;;
      [2-9][2]|2  )  echo ${1}nd ;;
      [2-9][3]    )  echo ${1}rd ;;
      [1][1-9]|*  )  echo ${1}th ;;
    esac
}

discordian_date()
{
    M=${1:-$(date +%_m)}
    D=${2:-$(date +%_d)}
    YEAR=${3:-$(date +%Y)}
    Y=$(( ${3:-$(date +%Y)} + 1166 ))

    if [ $M -gt 12 ]; then
      echo Month out of range of year
      exit 1
    fi

    if [ $D -gt $(month_len $M $YEAR) -o $D -le 0 ]; then
      echo Day out of range of month
      exit 1
    fi

    if [ $(month_len $M $YEAR) -eq 29 -a $M -eq 2 -a $D -eq 29 ]; then
      echo "St. Tib's Day, $Y YOLD"
      TIB=1
    fi

    days=$D

    for (( m=1; m<$M; m++ ))
    do
      ((days+=$(month_len $m $YEAR)))
    done

    dayofyear=$days

    if [ $(month_len 2 $YEAR) -eq 29 -a $dayofyear -ge 60 ]; then
      ((--dayofyear))
    fi

    seasonday=$(( dayofyear % 73 ))
    [ $seasonday -eq 0 ] && seasonday=73

    case $seasonday in
      5)  echo Today is "${APOSTLE[$((dayofyear / 73))]}", in the YOLD $Y
          season="${SEASONS[$((dayofyear / 73))]}"
          ;;
     50)  echo Today is "${HOLYDAY[$((dayofyear / 73))]}", in the YOLD $Y
          season="${SEASONS[$((dayofyear / 73))]}"
          ;;
      *)  case $dayofyear in
            73|146|219|291|365)  season="${SEASONS[$((dayofyear / 73))-1]}" ;;
            *)                   season="${SEASONS[$((dayofyear / 73))]}" ;;
          esac
          ;;
    esac

    dayofweek="${WEEKDAY[$(( (dayofyear-1) % 5 ))]}"
}

compile_discordian()
{
    case $season in
      Chaos           )  true                           ;;
      Discord         )  echo -n "xxxx xxxx xxxx "      ;;
      Confusion       )  echo -n "xxxx "                ;;
      Bureaucracy     )  echo -n "xxxx xxxx xxxx xxxx " ;;
      "The Aftermath" )  echo -n "xxxx xxxx "           ;;
    esac

    for i in {1..73}
    do
      if [ $i -lt 10 ]; then
        if [ $i -eq 5 ]; then
          echo -n "xx*5 "
        else
          echo -n "xxx$i "
        fi
      elif [ $i -eq 50 ]; then
        echo -n "x*50 "
      else
        echo -n "xx$i "
      fi
    done
}

show_discordian()
{
    BO=$(tput smso)
    LD=$(tput rmso)
    TODAY=$seasonday
    [ ${#TODAY} -eq 1 ] && TODAY=xxx${TODAY}
    [ ${#TODAY} -eq 2 ] && TODAY=xx${TODAY}

    if [ $TIB -eq 1 ]; then
      BOLD_TODAY=$TODAY
    else
      BOLD_TODAY=${BO}${TODAY}${LD}
    fi

    if [ $seasonday -eq 5 ]; then
      TODAY="*5 "
      BOLD_TODAY=${BO}${TODAY}${LD}
    fi

    if [ $seasonday -eq 50 ]; then
      TODAY="*50"
      BOLD_TODAY=${BO}${TODAY}${LD}
    fi

    row=$(compile_discordian)

    echo
    echo "     $season $Y"
    echo "  SM   BT   PD   PP   SO"

    for i in {0..375..25}
    do
      [ "X${row:i:25}" == "X" ] && break
      echo "${row:i:25}" | sed "s/$TODAY/$BOLD_TODAY/" |  sed 's/x/ /g'
    done
    echo
}

### BEGIN PROGRAM ###

case $1 in
  -d)
    shift
    discordian_date "$@"
    [ $TIB -eq 1 ] && exit 0
    echo -n "Today is $dayofweek, the $(ordinal $seasonday) "
    echo "day of $season in the YOLD $Y"
    ;;
  -*|*[a-z]*)
    echo Invalid option \'${1:1}\'
    exit 1
    ;;
  *)
    discordian_date "$@"
    show_discordian | while read
                      do
                        echo "     $REPLY"
                      done
esac

### EOF ###
