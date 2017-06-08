#!/bin/bash
# Função status interface

statusint () {

find /etc/hostname | zenity --progress --width 350 --pulsate --text "Aguarde..." \

	interface=`zenity --width=250 --height=200 --entry \
			--title="Gerenciador de Rede." \
			--text="Digite a interface:"`

		if [ $? -eq 1 ] ; then
		menu

			elif [ -z $interface ] ; then
			zenity --error --text="Informe uma interface de rede."
			statusint

				elif [ -z `ifconfig -a | cut -d" " -f 1 | grep $interface` ] ; then
				zenity --error --text="Interface de rede não existe."
				statusint

		else
		zenity --info --text="A interface existe"
		fi
menu
}
	