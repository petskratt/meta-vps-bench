#!/bin/bash

# rm

{
echo "**** CPU1" 
sysbench --test=cpu --cpu-max-prime=10000 --num-threads=1 run >> cpu1.result

echo "**** CPU2" 
sysbench --test=cpu --cpu-max-prime=10000 --num-threads=2 run >> cpu2.result

echo "**** CPU4" 
sysbench --test=cpu --cpu-max-prime=100000 --num-threads=4 run >> cpu4.result

echo "**** OLTP1" 
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=test --mysql-user=root --mysql-password=$PASSWORD --num-threads=1 --max-time=60 run >> oltp1.result

echo "**** OLTP4" 
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=test --mysql-user=root --mysql-password=$PASSWORD --num-threads=4 --max-time=60 run >> oltp4.result

echo "**** OLTP8" 
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=test --mysql-user=root --mysql-password=$PASSWORD --num-threads=8 --max-time=60 run >> oltp8.result

echo "**** RNDRW - random read/write"
sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw --max-time=300 run >> rndrw.result

echo "**** RNDWR - random write"
sysbench --test=fileio --file-total-size=6G --file-test-mode=rndwr --max-time=300 run >> rndwr.result

echo "**** SEQWR - sequential write" 
sysbench --test=fileio --file-total-size=6G --file-test-mode=seqwr --max-time=300 run >> seqwr.result

echo "**** SEQRD - sequential read" 
sysbench --test=fileio --file-total-size=6G --file-test-mode=seqrd --max-time=300 run >> seqrd.result

echo "**** RNDRD - random read" 
sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrd --max-time=300 run >> rndrd.result

echo "**** SEQREWR - sequential rewrite" 
sysbench --test=fileio --file-total-size=6G --file-test-mode=seqrewr --max-time=300 run >> seqrewr.result

echo "**** MEMORY" 
sysbench --test=memory run  >> memory.result


if [ "$1" = "speedtest" ]; then

	echo "**** SPEEDTEST"
	# SpeedTest Locations
	
	# Argentina
	#  900) Telecentro (Buenos Aires, Argentina) [11156.20 km]
	./speedtest-linux-amd64-speed-issues -r  --server 900  >> speedtest900.result
	
	# Australia
	# 2627)Telstra (Perth, Australia) [18701.04 km
	./speedtest-linux-amd64-speed-issues -r  --server 2627  >> speedtest2627.result
	
	# Brazil
	#  3068) TIM Brasil (Sao Paulo, Brazil) [10920.56 km]
	./speedtest-linux-amd64-speed-issues -r  --server 3068  >> speedtest3068.result 
	
	# China 
	# 3633) China Telecom (Shanghai, China) [9167.07 km]
	./speedtest-linux-amd64-speed-issues -r  --server 3633  >> speedtest3633.result 
	
	# France - not functional
	# 9192) Silverblades.fr (Paris, France) [7972.84 km]
	#./speedtest-linux-amd64-speed-issues -r  --server 9192  >> speedtest9192.result 
	
	# Germany
	# 1475) IPB (Berlin, Germany) [8049.48 km]
	./speedtest-linux-amd64-speed-issues -r  --server 1475  >> speedtest1475.result 
	# 2398) Studio Funk GmbH & Co. KG (Hamburg, Germany) [7833.78 km]
	./speedtest-linux-amd64-speed-issues -r  --server 2398  >> speedtest2398.result 
	
	# Hong Kong
	# 1536) STC (Hong Kong, China) [10397.15 km]
	./speedtest-linux-amd64-speed-issues -r  --server 1536  >> speedtest1536.result 
	
	# India
	# 1718) Vodafone India (Mumbai, India) [12404.46 km]
	./speedtest-linux-amd64-speed-issues -r  --server 1718  >> speedtest1718.result 
	
	# Japan - not functional
	# 7510) ASEINet (Tokyo, Japan) [7686.34 km]
	#./speedtest-linux-amd64-speed-issues -r  --server 7510  >> speedtest7510.result
	
	# Russia
	# 3170) Comstar-r (Nizhny Novgorod, Russian Federation) [8322.08 km]
	./speedtest-linux-amd64-speed-issues -r  --server 3170  >> speedtest3170.result 
	
	# Spain
	# 3863) Orange (Madrid, Spain) [8449.11 km]
	./speedtest-linux-amd64-speed-issues -r  --server 3863  >> speedtest3863.result 
	
	# South Korea
	# 6527) kdatacenter.com (Seoul, South Korea) [8297.88 km]
	./speedtest-linux-amd64-speed-issues -r  --server 6527  >> speedtest6527.result 
	
	# United Kingdom
	
	# 2789) Vodafone UK (London, Great Britain) [7632.74 km]
	./speedtest-linux-amd64-speed-issues -r  --server 2789  >> speedtest2789.result 
	# 1531) Cloud Space UK (Canterbury, Great Britain) [7704.11 km]
	./speedtest-linux-amd64-speed-issues -r  --server 1531  >> speedtest1531.result 
	
	
	# United States
	
	# 3165) Georgia Institute of Technology (Atlanta, GA, United States) [3494.75 km]
	./speedtest-linux-amd64-speed-issues -r  --server 3165  >> speedtest3165.result
	
	# 10386) Speedtest.net (Dallas, TX, United States) [2711.58 km]
	./speedtest-linux-amd64-speed-issues -r  --server 10386  >> speedtest10386.result
	
	# 10392) Speedtest.net (Los Angeles, CA, United States) [1601.78 km]
	./speedtest-linux-amd64-speed-issues -r  --server 10392  >> speedtest10392.result
	
	# 2947) Atlantic Metro (New York City, NY, United States) [3833.63 km]
	./speedtest-linux-amd64-speed-issues -r  --server 2947  >> speedtest2947.result
	
	# 7519) Quonix, Inc. (Philadelphia, PA, United States) [3789.44 km] - not functional
	#./speedtest-linux-amd64-speed-issues -r  --server 7519  >> speedtest7519.result
	
	#  603) Unwired (San Francisco, CA, United States) [1157.58 km]
	./speedtest-linux-amd64-speed-issues -r  --server 603  >> speedtest603.result
	
	# 1776) Comcast (Chicago, IL, United States) [2762.90 km]
	./speedtest-linux-amd64-speed-issues -r  --server 1776  >> speedtest1776.result  

fi

} >> result.log
