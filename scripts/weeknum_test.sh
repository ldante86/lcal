#!/bin/bash -

for i in {1..12}
do
  ../bin/lcal -W $i $1
done
