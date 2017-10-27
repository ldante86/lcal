#!/bin/bash
#
# SCRIPT: ddate.sh
# AUTHOR: Luciano D. Cecere
# DATE: 06/15/2015-01:13:37 PM
########################################################################
#
# ddate.sh - Generate Discordian date (ddate clone)
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

month_len()
{
    case $1 in
      4|6|9|11)
        echo 30
        ;;
      1|3|5|7|8|10|12)
        echo 31
        ;;
      2)
        if [[ $(($2 % 4)) -eq 0 && $(($2 % 100)) -ne 0 || $(($2 % 400)) -eq 0 ]]; then
          echo 29
        else
          echo 28
        fi
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

### PROGRAM START ###

if [ "$1" = "-h" ]; then
  echo Usage: $PROGRAM [-h] [MM DD YYYY]
  exit 0
fi

if [ $# -eq 4 ]; then
  case $4 in
    1|0)  MODE=$4 ;;
  esac
elif  [ $# -eq 1 ]; then
  case $1 in
    1|0)
      MODE=$1 
      shift
      ;;
    *|" ")
      shift
      ;;
  esac
else
  MODE=0
fi

M=${1:-$(date +%_m)}
[ $M -ne $(date +%_m) ] && MODE=1
D=${2:-$(date +%_d)}
[ $D -ne $(date +%_d) ] && MODE=1
YEAR=${3:-$(date +%Y)}
[ $YEAR -ne $(date +%Y) ] && MODE=1
Y=$(( ${3:-$(date +%Y)} + 1166 ))

if [ $M -gt 12 ]; then
  echo Month out of range
  exit 1
fi

if [ $D -gt $(month_len $M $YEAR) ] || [ $D -le 0 ]; then
  echo Day out of range
  exit 1
fi

if [ $(month_len $M $YEAR) -eq 29 ] && [ $M -eq 2 -a $D -eq 29 ]; then
  echo "St. Tib's Day, $Y YOLD"
  exit 0
fi

days=$D

for (( m=1; m<$M; m++ ))
do
  ((days+=$(month_len $m $YEAR)))
done

dayofyear=$days

if [ $(month_len 2 $YEAR) -eq 29 ] && [ $dayofyear -ge 60 ]; then
  ((--dayofyear))
fi

seasonday=$(( dayofyear % 73 ))
[ $seasonday -eq 0 ] && seasonday=73

case $seasonday in
  5)
    echo Today is "${APOSTLE[$((dayofyear / 73))]}", in the YOLD $Y
    exit
    ;;
 50)
    echo Today is "${HOLYDAY[$((dayofyear / 73))]}", in the YOLD $Y
    exit
    ;;
  *)
    case $dayofyear in
      73|146|219|291|365)
        season="${SEASONS[$((dayofyear / 73))-1]}"
        ;;
      *)
        season="${SEASONS[$((dayofyear / 73))]}"
        ;;
    esac
    ;;
esac

dayofweek="${WEEKDAY[$(( (dayofyear-1)%5))]}"

case $MODE in
    0)
      echo -n "Today is $dayofweek, the $(ordinal $seasonday) "
      echo "day of $season in the YOLD $Y"
      ;;
    1)
      echo "$dayofweek, $season $seasonday, $Y YOLD"
      ;;
esac

### EOF ###
