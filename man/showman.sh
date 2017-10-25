#!/bin/sh -

#set -- lcal.1

case $1 in
	'')
		exit 1
		;;
	*.gz)
		/usr/bin/man ./$1
		;;
	*)
		/usr/bin/nroff -man $1 | less
		;;
esac
