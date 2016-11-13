#!/bin/echo This file must be sourced.

lmenu()
{
echo "\
cal   date       display a calendar
ddate date       show Discordian date
dow   date       show day of week
jdn   date       show Julian Day Number
jul   date       show Julian calendar
ncal  date       display ncal calendar
html  date       show html calendar
wn    date       show week number
yy    year       show yearly calendar\
"
}

cal()
{
	lcal "$@"
}

ncal()
{
	lcal --ncal "$@"
}

ddate()
{
	lcal --discordian "$@"
}

html()
{
	local browser=firefox
	local calendar="/tmp/${RANDOM}.html"

	lcal --html "$@" > "$calendar"
	"$browser" "$calendar"
}

dow()
{
	lcal -d "$@"
}

wn()
{
	lcal -w "$@"
}

yy()
{
	lcal -y "$@"
}

jul()
{
	lcal --julian "$@"
}

jdn()
{
	lcal --gregorian-to-jdn "$@"
}
