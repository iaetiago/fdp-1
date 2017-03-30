#!/bin/bash
DIG=1; PRI=0; SEG=0; TER=0 clear
while (( $DIG != 0 )); do
echo "Digite um salário:"
read DIG; SAL=$DIG
[ $SAL == $PRI ] && let SAL=(TER-1)
[ $SAL == $SEG ] && let SAL=(TER-1)
if (( $SAL > $PRI )); then
	TER=$SEG; SEG=$PRI; PRI=$SAL
else
	if (( $SAL > $SEG )); then
		TER=$SEG; SEG=$SAL
	else
		if (( $SAL > $TER )); then
			TER=$SAL
		fi
	fi 
fi
done 
echo "Os 3 maiores salarios são respepctivamente: $PRI, $SEG e $TER"
