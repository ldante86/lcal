#!/bin/bash -

# 4/4, 6/6, 8/8, 10/10, 12/12 and the last day of February allways fall
# on the same day. That day is called "Doomsday"
#
# https://en.wikipedia.org/wiki/Doomsday_rule
# http://homer.freeshell.org/dd.cgi?date=11%2F30%2F2016
#

y="${1:-$(date +%Y)}"

days=(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

_base_doomsday()
{
        case $1 in
                1500|1900|2300)  echo 3 ;;
                1600|2000|2400)  echo 2 ;;
                1700|2100|2500)  echo 0 ;;
                1800|2200|2500)  echo 5 ;;
        esac
}

_doomsday()
{
        local cent="${1:0:2}00"

        local year="${1:2}"

        local base="$(_base_doomsday $cent)"

        echo $(( (base + year + ( year / 4 )) % 7 ))

}

_doomsday_2()
{
        local cent="${1:0:2}00"

        local year="${1:2}"

        local base="$(_base_doomsday $cent)"

	doomsday=$(( base + (((year / 12) + (year % 12) + ((year % 12) / 4)) % 7) ))

	if (( doomsday > 7 )); then
		echo ${days[ $((doomsday - 7)) ]}
	else
		echo ${days[doomsday]}
	fi
}
