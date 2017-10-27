#!/bin/sh -

opt="$1"

browser=/usr/bin/firefox

[ "$opt" != "-h" ] && unset opt

calendar="/tmp/rcal-html.html"
rcal $opt --html "$@" > $calendar
$browser "$calendar"

rm "$calendar"
