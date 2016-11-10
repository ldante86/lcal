#!/bin/bash -

# PROGRAM: doc.sh
# AUTHOR: Luciano D. Cecere
# YEAR: 2016
# PURPOSE: Extract documentation from script files and create
# a manual. Special comment tags are:
#	"#%%"	is the header
#	"#% "	is the body

FILE="$1"

if [ "x$FILE" = "x" ] || [ ! -e "$FILE" ]; then
	exit 1
fi

printf "\n%s\n\n" "Function documentation manual for $FILE"

while read
do
	if [ "${REPLY:0:3}" = "#%%" ]; then
		echo ----------------------------
		echo
		echo -n "Function: "
		echo -n "$REPLY" | sed 's/#%% //' | awk '{print $2}'
		echo "$REPLY" | sed 's/#%% //'
	fi
	if [ "${REPLY:0:3}" = "#% " ]; then
		printf "\t"
		echo "$REPLY" | sed 's/#% //' | sed 's/purpose: //'
	fi
done < "$FILE"
