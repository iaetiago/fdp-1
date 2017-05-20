#!/bin/bash
clear
#########################################################################
# 1 'Criar arquivos e diretorios'
# 2 'Copiar arquivos e diretorios'
# 3 'Mover ou renomear arquivos e diretorios'
# 4 'Apagar arquivos e diretorios'
# 5 'Backup'
# 6 'Sair')
######################### FUNÇÃO ##########################################
function CRIARQ(){
	QNT=$(dialog 	--stdout					\
	--title 'Criação do Arquivo ou diretorio'			\
	--inputbox 'Deseja criar arquivo(a) ou diretorio(d)? '		\
	0 0)
#--------------------------------------------------------------------------#
if [ $QNT == "a" ]; then 
ARQUIVO=$(dialog	--stdout					\
--title 'Criação de arquivo'						\
--inputbox 'Digite o nome e a extenção que deseja para seu arquivo:'	\
0 0)
		cat $ARQUIVO
elif [ $QNT == "d" ]; then
DIRETORIO=$(dialog	--stdout					\
--title 'Criação de Diretorio'						\
--inputbox 'Digite o nome do Diretorio desejado ?'			\
0 0)
	mkdir $DIRETORIO
fi
#---------------------------------------------------------------------#
}

function CARQ(){


ARQ=$(dialog   --stdout						\
		--title	'Nome do arquivo que deseja copiar'	\
		--inputbox 'insira o nome do arquivo'		\
0 0)

SELECIONAR=$(dialog   --stdout					\
		--title	'Nome do diretorio onde deseja copiar'	\
		--inputbox 'Insira o nome do diretorio'		\
0 0)

cp $ARQ $SELECIONAR

SUCESSO=$(dialog --stdout		\
		--title 'Sucesso'              \
		--msgbox 'Copiado com sucesso' \
		0 0)

}
#---------------------------------------------------------
function MRARQ(){

ARQ=$(dialog   --stdout						\
		--title	'Nome do arquivo que deseja remover'	\
		--inputbox 'Insira o nome do arquivo'		\
0 0)

rm $ARQ
}

function APARQ(){
ARQ=$(dialog   --stdout						\
		--title	'Nome do arquivo que deseja remover'	\
		--inputbox 'Insira o nome do arquivo'		\
0 0)

rm $ARQ

}

#function BKARQ(){
#}

MENU=$(dialog --stdout                          \
	--title 'Gerenciamento de Arquivo'	\
	--menu   'Escolha uma opçao'		\
	0 0 0					\
 1 'Criar arquivos e diretorios'		\
 2 'Copiar arquivos e diretorios'		\
 3 'Mover ou renomear arquivos e diretorios'	\
 4 'Apagar arquivos e diretorios'		\
 5 'Backup'					\
 6 'Voltar')					\

case $MENU in

  1) CRIARQ ;;
  2) CARQ ;;
  3) MRARQ ;;
  4) APARQ ;;
  5) BKARQ ;;
  6) echo; exit 0 ;;
  *) read -p 'Opção inválida'; read PPP; menu ;; 

esac
