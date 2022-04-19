#!/bin/bash
echo "CPU test 2 - 30000"
for i in {1..5}
do
	echo "******* No. "$i
	sysbench --test=cpu --cpu-max-prime=30000 --time=8 run
done
