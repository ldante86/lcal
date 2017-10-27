#!/bin/echo source this file
#
# rcal shell function shortcuts
#
# Note: these functions might override existing programs
#       with the same name, so comment out functions
#       like cal() if you still want to use the real cal.
#

cal() { rcal "$@"; }

ncal() { rcal --ncal "$@"; }

ddate() { rcal --ddate "$@"; }

dow() { rcal -D "$@"; }

html() {
	rcal --html "$@"
}
