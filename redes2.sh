#!/bin/bash
clear
########################## FUNÇÃO ##########################################
function DQTC(){

dialog	--yes-label Sim --no-label Não				\
	--title 'Modifica a conexão'				\
	--yesno 'Deseja realmente modificar a conexão? '	\
 	0 0
VAR=$?
if [ $VAR == 1 ]; then
	DIG

elif [ $VAR == 0 ]; then 
LOOP=$( dialog --stdout --yes-label Sim --no-label Não		\
	--title 'Loopback'					\
	--yesno 'Deseja configurar o loopback? '		\
	0 0)

if [ $LOOP == 1 ]; then
	cat 'auto lo' > /tmp/fenix/interfaces
	echo 'iface loopback inet ' >> /tmp/fenix/interfaces
DIG

else
	echo 'auto lo' >> /tmp/fenix/interfaces
	echo 'iface loopback inet ' >> /tmp/fenix/interfaces

SUCESSO=$( dialog  --stdout --ok-label Continuar		\
--title 'Sucesso'						\
--msgbox 'Configuração do loopback finalizada com sucesso.'	\
0 0)

fi
fi
dialog	--yes-label Sim --no-label Não				\
	--title 'eth0'						\
	--yesno 'Deseja configurar o eth0? '			\
	0 0
QNT=$?
if [ $QNT == 0 ]; then
	MODO=$( dialog --stdout					\
	--title	'Modo'						\
	--menu 'Escolha ao Modo a ser utilizado'		\
	0 0 0							\
	1  'auto'						\
	2  'allow-hotplug'					\
	3  'Voltar')
	if [ $MODO == 1 ]; then
		MODO=$( dialog --stdout					\
		--title	'Modo'						\
		--menu 'Escolha ao Modo a ser utilizado'		\
		0 0 0							\
		dhcp  'Endereço por DHCP'				\
		static 'Endereçamento Estático'				\
		Voltar 'Menu raiz')
		#QNT=$( dialog --stdout					\
		#--title 'Tipo'						\
		#--inputbox 'dhcp ou static :'				\
		#0 0)
		echo 'auto eth0' >> /tmp/fenix/interfaces
		echo "iface eth0 inet $MODO" >> /tmp/fenix/interfaces

		if [ $MODO == 'static' ]; then
			ADDRESS=$( dialog --ok-label Continuar --cancel-label Cancelar	\
			 --title 'Modifica Interface'					\
			 --inputbox 'Por favor , insira o address desejado: '		\
			 0 0)

			NETMASK=$( dialog --ok-label Continuar --cancel-label Cancelar	\
			 --title 'Modifica Interface'					\
			 --inputbox 'Por favor , insira o Netmask desejado: '		\
			 0 0)

			NETWORK=$( dialog --ok-label Continuar --cancel-label Cancelar	\
			--title 'Modifica Interface'					\
			--inputbox 'Por favor , insira o Network desejado: '		\
			 0 0)

			BROADCAST=$( dialog --ok-label Continuar --cancel-label Cancelar\
			 --title 'Modifica Interface'					\
			 --inputbox 'Por favor , insira o Broadcast desejado: '		\
			 0 0)
				echo "address:$ADDRES" >> /tmp/fenix/interfaces
				echo "netmask:$NETMASK" >> /tmp/fenix/interfaces
				echo "network:$NETWORK" >> /tmp/fenix/interfaces
				echo "broadcast:$BROADCAST" >> /tmp/fenix/interfaces


			SUCESSO=$( dialog  --ok-label Continuar				\
			--title 'Sucesso'						\
			--msgbox 'Configuração do modo e tipo finalizada com sucesso.'	\
			0 0)
		elif [ $MODO == 'voltar' ]; then
			DIG
		#elif [ $MOD == 'dhcp' ]; then
		#	INTERFACE=$( dialog --stdout				\
		#	--title	'Interface eth0'				\
		#	--yenso'

		fi
	fi
fi
if [ $MODO == 2 ]; then
QNT=$( dialog --stdout						\
	--title 'Tipo'						\
	--inputbox 'dhcp ou static :'				\
	0 0)
	echo 'allow-hotplug eth0' >> /tmp/fenix/interfaces
	echo 'iface eth0 inet $QNT' >> /tmp/fenix/interfaces


if [ $QNT == 'static' ]; then
ADDRESS=$( dialog --ok-label Continuar --cancel-label Cancelar	\
 --title 'Modifica Interface'					\
 --inputbox 'Por favor , insira o address desejado: '		\
 0 0)

NETMASK=$( dialog --ok-label Continuar --cancel-label Cancelar	\
 --title 'Modifica Interface'					\
 --inputbox 'Por favor , insira o Netmask desejado: '		\
 0 0)

NETWORK=$( dialog --ok-label Continuar --cancel-label Cancelar	\
 --title 'Modifica Interface'					\
--inputbox 'Por favor , insira o Network desejado: '		\
 0 0)

BROADCAST=$( dialog --ok-label Continuar --cancel-label Cancelar\
 --title 'Modifica Interface'					\
 --inputbox 'Por favor , insira o Broadcast desejado: '		\
 0 0)
	echo "address:$ADDRES" >> /tmp/fenix/interfaces
	echo "netmask:$NETMASK" >> /tmp/fenix/interfaces
	echo "network:$NETWORK" >> /tmp/fenix/interfaces
	echo "broadcast:$BROADCAST" >> /tmp/fenix/interfaces


SUCESSO=$( dialog  --ok-label Continuar				\
	--title 'Sucesso'					\
	--msgbox 'Configuração do modo finalizada com sucesso.'	\
	0 0)

elif [ $MODO == 3 ]; then
	DIG
else 
	echo 'auto eth0' >> /tmp/fenix/interfaces
	DIG
fi
fi
}

################### MENU ##########################################
function DIG(){
REDE=$( dialog	--stdout					\
	--title 'Gerenciamento de Redes'			\
	--menu  'Escolha uma opção: '				\
	0 0 0							\
		1 'Modificar a conexão'				\
		7 'Voltar')
case $REDE in
	1) DQTC ;;
	7) REDE ;;
#	*) read -p 'Opção Inválida.' PPP
esac
}


mkdir -p /tmp/fenix/
touch /tmp/fenix/interfaces
cp /etc/network/interfaces /tmp/fenix/interfaces

DIG

