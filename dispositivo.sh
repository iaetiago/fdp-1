#!/bin/bash
clear
function MDPD(){
clear
echo "Função MDPD"
read -p ' Pressione [enter] para finalizar' PPP
MENU
}
function RCPD(){
clear
echo "Função RCPD"
read -p ' Pressione [enter] para finalizar' PPP
MENU
}
function MDHD(){
clear
echo "Função MDHD"
read -p ' Pressione [enter] para finalizar' PPP
MENU
}
function VOLTAR(){
clear
MENU
}
MENU=$(dialog							\
	--stdout						\
	--title 'Gerenciamento de Dispositivos'			\
	--menu  'Escolha uma opção:'				\
	0 0 0 							\
	1 'Montar e desmontar pen drive'			\
	2 'Reconhcer pen drive'					\
	3 'Montar e desmontar HD'				\
	4 'Voltar')

case $MENU in
	1) MDPD ;;
	2) RCPD ;;
	3) MDHD ;;
	4) MENU ;;
	*) read -p 'Opção inválida.'; read PPP; MENU ;;

esac
MENU
}
