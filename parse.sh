#!/bin/bash

cat result.log |grep -i "requests\|Transactions\|Operations\|Transferred\|total time:\|\*\*\*\*\|Hosted\|Download:\|Upload:"

RESULT_CPU1="$(cat cpu1.result |grep "total time:"| cut -f2 -d":"|xargs|cut -d "s" -f1)"
RESULT_CPU2="$(cat cpu2.result |grep "total time:"| cut -f2 -d":"|xargs|cut -d "s" -f1)"
RESULT_CPU4="$(cat cpu4.result |grep "total time:"| cut -f2 -d":"|xargs|cut -d "s" -f1)"

RESULT_OLTP1="$(cat oltp1.result |grep transactions: |cut -f2 -d"("|cut -f1 -d")"|xargs|grep "per sec"|cut -f1 -d " ")"
RESULT_OLTP4="$(cat oltp4.result |grep transactions: |cut -f2 -d"("|cut -f1 -d")"|xargs|grep "per sec"|cut -f1 -d " ")"
RESULT_OLTP8="$(cat oltp8.result |grep transactions: |cut -f2 -d"("|cut -f1 -d")"|xargs|grep "per sec"|cut -f1 -d " ")"

RESULT_RNDWR="$(cat rndwr.result|grep Requests|cut -f1 -d"R"|xargs)"
RESULT_RNDRD="$(cat rndrd.result|grep Requests|cut -f1 -d"R"|xargs)"
RESULT_RNDRW="$(cat rndrw.result|grep Requests|cut -f1 -d"R"|xargs)"

RESULT_SEQRD="$(cat seqrd.result |grep Read|grep Written|cut -f2 -d"("|cut -f1 -d")"|xargs|grep Mb|cut -f1 -d"M")"
RESULT_SEREWR="$(cat seqrewr.result |grep Read|grep Written|cut -f2 -d"("|cut -f1 -d")"|xargs|grep Mb|cut -f1 -d"M")"
RESULT_SEQWR="$(cat seqwr.result |grep Read|grep Written|cut -f2 -d"("|cut -f1 -d")"|xargs|grep Mb|cut -f1 -d"M")"




###############

# Header Row
echo "CPU1,CPU2,CPU4,OLTP1,OLTP4,OLTP8,RNDWR,RNDRD,RNDRW,SEQRD,SEREWR,SEQWR"


echo "$RESULT_CPU1,$RESULT_CPU2,$RESULT_CPU4 ,$RESULT_OLTP1,$RESULT_OLTP4,$RESULT_OLTP8,$RESULT_RNDWR,$RESULT_RNDRD,$RESULT_RNDRW,$RESULT_SEQRD,$RESULT_SEREWR,$RESULT_SEQWR"

