#!/bin/bash -
#
# SCRIPT: stardate-month.sh
# AUTHOR: Luciano D. Cecere
# DATE: 02/01/2018-03:21:18 AM
########################################################################
#
# stardate-month.sh - Print stardate for month/year
# Copyright (C) 2018 Luciano D. Cecere <ldante1986@gmail.com>
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

m=${1:-$(date +%_m)}
y=${2:-$(date +%Y)}

if (( $y % 4 == 0 )) && (( $y % 100 != 0 )) || (( $y % 400 == 0 )); then
	len=("" 31 29 31 30 31 30 31 31 30 31 30 31)
else
	len=("" 31 28 31 30 31 30 31 31 30 31 30 31)
fi

printf "%s | %s\n" "Earth Date" "Star Date"

for ((d=1; d<=${len[m]}; d++))
do
	echo -n "$m $d $y  | "
	perl stardate.pl $m $d $y | awk -F" " '{print $4}'
done

echo
