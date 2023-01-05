#!/bin/bash
#
# Script para trazer status da bateria do notebook.
#
#O Objetivo deste script é poder usar o notebook no modo CLI
#sem perder a visualização da bateria.
#
#Desenvolvido por DevChimpa Dia: 05/01/2023
#E-mail para contato: chimpadeveloper@gmail.com
#
#
BATERIA=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY= | cut -c 23-25)
STATUS_BATERIA=$(cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_STATUS | tr = ' ' | cut -d' ' -f2)

clear

if [ $BATERIA -lt 20 ]
then
        echo " Bateria em: $BATERIA Status: Bateria Baixa"
        echo " POR FAVOR CONECTE A UMA FONTE DE ENERGIA "

elif  [ $STATUS_BATERIA = "Full" ] && [ $BATERIA -eq 100 ]
then
        echo " Bateria em: $BATERIA% Status: Carregada."
elif [ $STATUS_BATERIA = "Discharging" ]
then
        echo " Bateria: em $BATERIA% Status: Descarregando."
else
        echo " $BATERIA% Status: Carregando."
fi
#echo "Bateria em: $BATERIA% STATUS: $STATUS_BATERIA"
