#!/bin/bash
echo "FileIO 1, Threads=16, size=3G"
for i in {1..5}
do
	echo "****** No. "$i
	sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw prepare
	sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw run
	sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw cleanup
done	
