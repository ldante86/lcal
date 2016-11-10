#!/bin/bash -

# This script generates and html calendar and displays it in a browser.

# Usage html.sh [date string]

#browser=/usr/bin/yelp
browser=/usr/bin/firefox
#browser=/usr/bin/google-chrome

# These browsers don't interpret CSS, so no bolding.
#browser=w3m
#browser=lynx

calendar="/tmp/${RANDOM}.html"
../lcal --html "$@" > "$calendar"
"$browser" "$calendar"

rm "$calendar"
