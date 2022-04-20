#!/usr/bin/env bash
echo "Docker CPU test 2 prime-30000 memory-2g cpu-2"
for i in {1..5}
do
	echo "******* No."$i
	docker run --rm --memory="2g" --cpuset-cpus="0-1" zyclonite/sysbench --test=cpu --cpu-max-prime=30000 --time=8 run
done
