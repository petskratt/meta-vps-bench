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

RESULT_MEMORY="$(cat memory.result |grep "total time:"| cut -f2 -d":"|xargs|cut -d "s" -f1)"


###############

# Header Row
echo -e "CPU1\tCPU2\tCPU4\tOLTP1\tOLTP4\tOLTP8\tRNDWR\tRNDRD\tRNDRW\tSEQRD\tSEREWR\tSEQWR\tMEMORY"

echo -e "$RESULT_CPU1\t$RESULT_CPU2\t$RESULT_CPU4\t$RESULT_OLTP1\t$RESULT_OLTP4\t$RESULT_OLTP8\t$RESULT_RNDWR\t$RESULT_RNDRD\t$RESULT_RNDRW\t$RESULT_SEQRD\t$RESULT_SEREWR\t$RESULT_SEQWR\t$RESULT_MEMORY"
