#!/bin/echo This file must be sourced.

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
