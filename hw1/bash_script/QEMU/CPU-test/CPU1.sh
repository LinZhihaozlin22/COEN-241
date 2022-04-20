#!/bin/bash
echo "CPU test 1 - 20000"
for i in {1..5}
do
	echo "******* No. "$i
	sysbench --test=cpu --cpu-max-prime=20000 --time=8 run
done
