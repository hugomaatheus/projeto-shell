#!/bin/bash
# Scrip_shell.
# Redes p3
# Alunos: KEITELL, KALIL, HUGO, GABRIEL
# funcao ativar interface

intup () {

	find /etc/hostname | zenity --progress --width 350 --pulsate --text "Aguarde..." \

	active=`zenity --width=250 --height=200 --entry \
			--title="Gerenciador de Rede." \
			--text="Digite a interface:"`

		if [ $? -eq 1 ] ; then
		menu

			elif [ -z $active ] ; then
			zenity --error --text="Informe uma interface de rede."
			intup

				elif [ -z `ifconfig -a | cut -d" " -f 1 | grep $active` ] ; then
				zenity --error --text="Interface de rede não existe."
				intup

		else
		ifconfig $active up
		zenity --info --text="Interface Habilitada com sucesso."
		fi
	menu
}