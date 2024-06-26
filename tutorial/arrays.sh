#!/bin/bash

L=(one two three four five)

for item in ${L[@]}; do
	echo -n $item | wc -c
done
