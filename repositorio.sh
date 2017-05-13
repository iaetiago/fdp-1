#!/bin/bash
clear
function CP (){
clear
echo "Função CP"
raed -p 'Pressione [enter] para finalizar' PPP
MENU
}
function CCS (){
clear
echo "Função CCS"
read -p 'Pressione [enter] para finalizar' PPP
MENU
}
function CCSA (){
clear
echo "Função CCSA"
read -p 'Pressione [enter] para finalizar' PPP
MENU
}
function CCSD (){
clear
echo "Função CCSD"
read -p 'Pressione [enter] para finalizar' PPP
MENU
}
function Voltar(){
clear
MENU
}
MENU=$(dialog							\
		--stdout					\
		--title "Menu"					\
		--menu "Escolha uma opção:" 			\
		0 0 0						\
		1 'criar partição'				\
		2 'criar copia de segurança'			\
		3 'criar copia de segurança do arquivo'		\
		4 'criar copia de segurança do diretorio'	\
		5 'Voltar')

case $MENU in 
	1) CP ;;
	2) CCS ;;
	3) CCSA ;;
	4) CCSD ;;
	5) echo; exit 0 ;;
	*) read -p 'Opção inválida.'; read PPP; MENU ;;
esac
MENU
}

