#!/bin/sh -
exit
# Make HTML page
groff -mandoc -Thtml lcal.1  > lcal.1.html

# Make PDF file
groff -mandoc -Tpdf lcal.1  > lcal.1.pdf

