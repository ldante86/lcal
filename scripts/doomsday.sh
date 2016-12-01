#!/bin/bash -

# 4/4, 6/6, 8/8, 10/10, 12/12 and the last day of February allways fall
# on the same day. That day is called "Doomsday"
#
# https://en.wikipedia.org/wiki/Doomsday_rule
# http://homer.freeshell.org/dd.cgi?date=11%2F30%2F2016
#

year="${1:-$(date +%Y)}"

echo "Doomsday for $year is: $(lcal -d 4 4 $year)"
