#!/bin/bash
clear
##################### VARIAVEL #########################################
#AT=auto
#AL=allow-hottplug

###################### FUNÇÃO ##########################################
function DQTC(){
dialog	 								\
	--stdout							\
	--cancel-label Cancelar						\
	--title 'Modifica a conexão'					\
	--inputbox 'Por favor, insira o tipo de conexão  auto ou allow'	\
 	0 0
}
#-----------------------------------------------------------------------#
function DML(){
dialog	--yes-label Sim --no-label Não					\
	--title 'Loopback'						\
	--yesno 'Deseja configurar o loopback? '			\
	0 0
LOOPBACK=$?
if [ $LOOPBACK == 0 ]; then
	echo 'auto lo' >> /tmp/fenix/interfaces
	echo 'iface loopback inet ' >> /tmp/fenix/interfaces
else 
	DIG
#-----------------------------------------------------------------------#
dialog  --ok-label MENU							\
	--title 'Sucesso'						\
	--msgbox 'Configuração finalizada com sucesso.'			\
	0 0
fi
}
#-----------------------------------------------------------------------# 
function DMAT0(){
dialog	--yes-label Sim --no-label Não					\
	--title 'eth0'							\
	--yesno 'Deseja configurar o eth0? '				\
	0 0
ET=$?
#if [ $CONEXAO == auto ]; then 
#	echo ' $AT eth0 >> /tmp/fenix/interfaces'
#else
#	echo ' $AL etho >> /tmp/fenix/interfaces'
#fi
	if [ $ET == 0 ]; then
		echo 'iface eth0 inet static ' >> /tmp/fenix/interfaces
	else 
		DIG
	fi

ADDRESS=$(dialog --cancel-label Cancelar				\
 --title 'Modifica Interface'						\
 --inputbox 'Por favor , insira o address desejado: '			\
 0 0)

NETMASK=$(dialog --cancel-label Cancelar				\
 --title 'Modifica Interface'						\
 --inputbox 'Por favor , insira o Netmask desejado: '			\
 0 0)

NETWORK=$(dialog --cancel-label Cancelar				\
 --title 'Modifica Interface'						\
 --inputbox 'Por favor , insira o Network desejado: '			\
 0 0)

BROADCAST=$(dialog --cancel-label Cancelar				\
 --title 'Modifica Interface'						\
 --inputbox 'Por favor , insira o Broadcast desejado: '			\
 0 0)
	echo "$ADDRES" >> /tmp/fenix/interfaces
	echo "$NETMASK" >> /tmp/fenix/interfaces
	echo "$NETWORK" >> /tmp/fenix/interfaces
	echo "$BROADCAST" >> /tmp/fenix/interfaces
#-----------------------------------------------------------------------#
dialog  --ok-label MENU							\
	--title 'Sucesso'						\
	--msgbox 'Configuração finalizada com sucesso.'			\
	0 0
}
#################### MENU ###############################################
function DIG(){
REDE=$(dialog	--stdout						\
	--title 'Gerenciamento de Redes'				\
	--menu  'Escolha uma opção: '					\
	0 0 0								\
		1 'Deseja Qual tipo de conexão'				\
		2 'Deseja modificar loopback'				\
		3 'Deseja modificar auto eth0'				\
		4 'Deseja modificar auto eth1'				\
		5 'Deseja modificar qualquer outra interface? '		\
		6 'Insira o Gaetway '					\
		7 'Voltar')
case $REDE in
	1) DQTC ;;
	2) DML ;;
	3) DMAT0 ;;
	4) DMAT1 ;;
	5) DMQOI ;;
	6) IG ;;
	7) REDE ;;
	*) read -p 'Opção Inválida.' PPP
esac
}
DIG

#echo $QNT
