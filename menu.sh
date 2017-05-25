#!/bin/bash
clear
#########################FUNÇÃO###############################
function RAIZ (){
MENU=$( dialog --stdout						\
	--title 'Programa Omega '				\
	--menu 'Escolha o Gerenciamento que deseja fazer: '	\
	0 0 0							\
		1 'Gerenciamento de Usuário'			\
		2 'Gerenciamento de Arquivo'			\
		3 'Gerenciamento de Rede   '			\
		4 'Gerenciamento de Repositorio'		\
		5 'Gerenciamento de Dispositivo')
case $MENU in 
	1) GU ;;
	2) GA ;;
	3) GRD ;;
	4) GR ;;
	5) GD ;;
esac
}
	RAIZ
