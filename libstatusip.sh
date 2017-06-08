#!/bin/bash
# Função status IP

statusip () {

find /etc/hostname | zenity --progress --width 350 --pulsate --text "Aguarde..." \

	interface=`zenity --width=250 --height=200 --entry \
			--title="Gerenciador de Rede." \
			--text="Digite a interface:"`

		if [ $? -eq 1 ] ; then
		menu

			elif [ -z $interface ] ; then
			zenity --error --text="Informe uma interface de rede."
			statusip

				elif [ -z `ifconfig -a | cut -d" " -f 1 | grep $interface` ] ; then
				zenity --error --text="Interface de rede não existe."
				statusp

		else
		ifconfig $interface | grep "inet end."| cut -f2
		zenity --info --text="Visualize as informações de interface no terminal."
		fi
menu
}
	
