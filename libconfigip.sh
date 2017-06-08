#!/bin/bash
# Scrip_shell.
# Redes p3
# Alunos: KEITELL, KALIL, HUGO, GABRIEL
# funcao Alterar IP

configip () {

	find /etc/hostname | zenity --progress --width 350 --pulsate --text "Aguarde..." \

	ip=`zenity --width=250 --height=200 --entry \
			--title="Gerenciador de Rede." \
			--text="Digite um IP para maquina EX: 192.168.1.100/28:"`

	   	if [ $? -eq 1 ] ; then
		menu

			elif [ -z $ip ] ; then     
			zenity --error --text="Informe um IP para a máquina."
			configip
	   	fi

	interface=`zenity --width=250 --height=200 --entry \
			--title="Gerenciador de Rede." \
			--text="Digite a interface de rede que deseja atribuir o IP EX: wlan0 / eth0.:"`

		if [ $? -eq 1 ] ; then
	   	menu

			elif [ -z $interface ] ; then     
			zenity --error --text="Informe uma interface para configurar."
			configip

				elif [ -z `ifconfig | cut -d " " -f 1 |grep $interface` ] ; then
				zenity --error --text="Interface de rede não existe."
				configip
		
	   	else
		ifconfig $interface $ip
		zenity --info --text="IP alterado com sucesso."
	   	fi
	menu
}