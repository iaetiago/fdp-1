#!/bin/bash
#
#
#Função para montar o PenDriver
Montar()
{
#Carrega os modulos usb
modprobe usb-ohci
modprobe usb-storage
modprobe usbcore

#Cria um diretorio chamado pen em /mnt/pen
if [ ! -d /mnt/pen ]; then
    mkdir /mnt/pen
fi

#Monta o PenDriver em /mnt/pen
mount -t usbdevfs usbdevfs /proc/bus/usb 2> /dev/null
sleep 1
mount -t vfat -o umask=0000 /dev/sda1 /mnt/pen 2> /dev/null

#Acessa o diretorio /mnt/pen
cd /mnt/pen
ls
}

#Função para desmontar o PenDriver
Desmontar()
{
#Demonta o /mnt/pen
umount /proc/bus/usb &> /dev/null
sleep 1
umount /mnt/pen 2> /dev/null

#Remove os modulos
rmmod usb-ohci 2> /dev/null
rmmod usb-sotage 2> /dev/null
rmmod usbcore 2> /dev/null
}

case "$1" in
'montar')
  Montar
  ;;
'desmontar')
  Desmontar
  ;;
*)
  echo "Use $0 montar ou desmontar"
esac
