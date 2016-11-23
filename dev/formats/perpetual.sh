#!/bin/bash -

. arrays

_is_leap()
{
        local y=$1
        if [ $((y % 4)) -eq 0 ] && 
           [ $((y % 100)) -ne 0 ] || 
           [ $((y % 400)) -eq 0 ]; then
                leap=1
        fi
}

_day_of_week()
{
        local m=1 d=1 y=$1

        local mcodes=(UNUSED 6 2 2 5 0 3 5 1 4 6 2 4)
        local w=$(( ((y / 4) - (y / 100)) + (y / 400) + d + y + ${mcodes[m]} ))

        _is_leap $y
        if [ $LEAP ] && [ $m -lt 3 ]; then
                ((w--))
        fi

        return $((w % 7))
}

#set "$@"

m=$1 d=1 y=$2

unset leap

_is_leap $y
_day_of_week $y
dow=$?

#echo $dow
if [ $leap ]; then
#echo LEAP_CYCLE$dow
	case $dow in
	0)  echo "${LEAP_CYCLE0[m-1]}" ;;
	1)  echo "${LEAP_CYCLE1[m-1]}" ;;
	2)  echo "${LEAP_CYCLE2[m-1]}" ;;
	3)  echo "${LEAP_CYCLE3[m-1]}" ;;
	4)  echo "${LEAP_CYCLE4[m-1]}" ;;
	5)  echo "${LEAP_CYCLE5[m-1]}" ;;
	6)  echo "${LEAP_CYCLE6[m-1]}" ;;
	esac
else
	case $dow in
	0)  echo "${NON_LEAP_CYCLE0[m-1]}" ;;
	1)  echo "${NON_LEAP_CYCLE1[m-1]}" ;;
	2)  echo "${NON_LEAP_CYCLE2[m-1]}" ;;
	3)  echo "${NON_LEAP_CYCLE3[m-1]}" ;;
	4)  echo "${NON_LEAP_CYCLE4[m-1]}" ;;
	5)  echo "${NON_LEAP_CYCLE5[m-1]}" ;;
	6)  echo "${NON_LEAP_CYCLE6[m-1]}" ;;
	esac
fi

