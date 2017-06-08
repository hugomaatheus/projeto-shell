#!/bin/bash
# Scrip_shell.
# Redes p3
# Alunos: KEITELL, KALIL, HUGO, GABRIEL
# funcao Desativar Interface

intdown () {

	find /etc/hostname | zenity --progress --width 350 --pulsate --text "Aguarde..." \

	desable=`zenity --width=250 --height=200 --entry \
			--title="Gerenciador de Rede." \
			--text="Digite a interface:"`

		if [ $? -eq 1 ] ; then
		menu

			elif [ -z $desable ] ; then
			zenity --error --text="Informe uma interface de rede."
			intdown

				elif [ -z `ifconfig -a | cut -d" " -f 1 | grep $desable` ] ; then
				zenity --error --text="Interface de rede não existe."
				intdown

		else
		ifconfig $desable down
		zenity --info --text="Interface desabilitada com sucesso."
		fi
	menu
}
