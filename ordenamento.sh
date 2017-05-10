#!/bin/bash
clear
INT=1
TESTE=0
NUMBER=0
while (( $INT != 0 )); do

read -p "Digite um número" NUMERO[$TESTE]
INT=${NUMERO[$TESTE]}
let TESTE=$TESTE+1
t=$TESTE

done
for (( i=0; i < $TESTE ; i++ )); do
	for (( j=0; j < $TESTE ; j++ )); do
		if (( $NUMBER <= ${NUMERO[$j]} )); then
			NUMBER=${NUMERO[$j]}
			x=$j
			QNT[$t]=$NUMBER
		fi
	done
		NUMERO[$x]=0
		let t=$t-1
		NUMBER=0
done
echo ${QNT[*]} 
