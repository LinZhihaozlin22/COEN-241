#!/usr/bin/env bash
echo "Docker CPU test 1 prime-20000 memory-4g cpu-2"
for i in {1..5}
do
	echo "******* No."$i
	docker run --rm --memory="4g" --cpuset-cpus="0-1" zyclonite/sysbench --test=cpu --cpu-max-prime=20000 --time=8 run
done
