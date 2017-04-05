#!/bin/bash
clear
var=1
while (( $var > 0 )); do
			echo "Digite seu salario : "
			read SALARIO
			
			sal=$(echo "scale=2; $SALARIO > 500.00" | bc )
			if (( $sal == 1)); then 
				sal=$(echo "scale=2; $SALARIO*1.1" | bc)
			else
				sal=$(echo "scale=2; $SALARIO*1.2" | bc )
			fi
			sal_temp=$(echo "scale=2; $SALARIO 1= 0.00" | bc)
			if (( $sal_temp == 1 )); then
				echo "O salario foi $sal"
			fi
			
			SAL=$(echo "scale=2; $SALARIO >= 0.01" | bc)
			
				var=1
			else
				var=0
			fi

done


