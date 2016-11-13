#!/bin/bash -

for i in {1..12}
do
  ../lcal -W $i $1
done
