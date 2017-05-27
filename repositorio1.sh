#!/bin/bash
clear
###################FUNÇÃO###########################################
function INP(){
	PA=$( dialog --stdout					\
	--title 'Instalação de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja instalar? '\
	0 0)
	apt-get install $PA

	SUCESSO=$( dialog --stdout				\
		--title 'Sucesso'				\
		--msgbox 'Instalação feita com sucesso'		\
		0 0)
DIG
}
function ATP(){
	AT=$( dialog --stdout	--yes-label Sim	--no-label Não	\
	--title 'Atualização de pacotes'			\
	--yesno ' Deseja realmente atualizar todos os pacotes ?'\
	0 0) 
AT=$?
if [ $AT = 0 ]; then 
	apt-get upgrade

	SUCESSO=$( dialog --stdout				\
		--title 'Sucesso'				\
		--msgbox 'Atualização feita com sucesso'	\
		0 0)
DIG
else 
	DIG
fi
}
function RMP(){
	RE=$( dialog --stdout					\
	--title 'Remoção de pacotes'				\
	--inputbox 'Qual o nome do pacote que deseja remover? '	\
	0 0)
	apt-get remove $RE

	SUCESSO=$( dialog --stdout				\
		--title 'Sucesso'				\
		--msgbox 'Remoção feita com sucesso'		\
		0 0)
DIG
}
function DIG(){ 
REP=$( dialog --stdout						\
	--title 'Gerenciador de Repositorio'			\
	--menu 'Escolha a opção desejada:'			\
	0 0 0							\
		1 'Intalação de pacotes'			\
		2 'Atualização de pacotes'			\
		3 'Remoção de pacote'				\ 
		4 'Voltar')
case $REP in
	1) INP ;;
	2) ATP ;;
	3) RMP ;;
	4) REP ;;
esac
}

