#!/bin/bash
# Scrip_shell.
# Redes p3
# Alunos: KEITELL, KALIL, HUGO, GABRIEL


zenity --warning --text="Bem vindo! Assistente de configuracao de interface. Execute como Root."

# area reservadas as bibliotecas
. libconfigip.sh
. libstatusip.sh
. libstatusint.sh
. libintup.sh
. libintdown.sh
clear
while true
do

menu(){
	submenu=`zenity --width=550 --height=250 --text "Selecione uma das opcoes" \
		--title="Assistente de configuracao de interface" --list --column "Número" --column "Função" \
		"1" "Alterar o ip de uma interface." "2" "Visualizar a configuracao de uma interface." "3" "Exibir Status de uma interface." "4" "Ativar interface de rede." "5" "Desativar a interface." "6" "Sair."`
}
menu
	if [ $? -eq 1 ] # se clicar em cancelar # -eq significa igual
	then
		clear
		exit

	elif [ -z $submenu  ] # -z significa nulo
		then
			zenity --error --text="Você não escolheu uma opção."
			menu
	else

case $submenu in

	1) configip ;;
	2) statusip ;;
	3) statusint ;;
	4) intup ;;
	5) intdown ;;
	6) clear
	   break ;;
esac
	fi
done
