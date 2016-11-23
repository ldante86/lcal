#!/bin/bash -

_is_leap()
{
        local y=$1
        if [ $((y % 4)) -eq 0 ] && 
           [ $((y % 100)) -ne 0 ] || 
           [ $((y % 400)) -eq 0 ]; then
                return 0
	else
		return 1
        fi
}

days=(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

n=0
for i in {1900..2000}
do
	_is_leap $i || { continue ; ((n++)); }

	if [ "$(lcal -d 1 1 $i)" = "${days[n]}" ]; then
		echo $i
		((n++))
	fi
done
