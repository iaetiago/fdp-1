#!/bin/bash
DIG=1; clear
echo "Digite um numero:"
read DIG
MENOR=$DIG
while (( $DIG != 0 )); do
	echo "Digite um numero:"
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
echo "O menor nÚmero é $MENOR e foi digitado $QNT vez(es)."
