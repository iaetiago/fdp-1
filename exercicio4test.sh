#!/bin/bash
DIG=1; QNT=1; clear
echo "Digite um número:"
read DIG
MENOR=$DIG
while (( $DIG != 0 )); do
	echo "Digite um número:"
	read DIG
	if [ $DIG != 0 ]; then
		if (( $DIG <= $MENOR )); then
			if (( $DIG < $MENOR )); then 
				MENOR=$DIG
				QNT=1
			else
				let QNT=($QNT+1)
			fi
		fi
	fi
done
echo "O menor número é $MENOR e repetiu $QNT vez(es)."
