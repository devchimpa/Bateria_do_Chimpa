#!/bin/bash

#Script para identificar quantas máquinas estão na minha rede.
#
#
#
RANGE_IP=$1
VALIDA=0
#ENDERECOS_COLETADOS="90:75:BC:E1:5D:10" 

echo "Varrendo a rede..."

ENDERECOS_COLETADOS=$( nmap -sn $RANGE_IP | grep MAC | awk {'print $3'} ) 

END_CONHECIDOS=( "DC:BF:E9:3C:9B:0D" "86:7E:FB:0B:63:29" "16:10:A9:6A:01:B5" "90:75:BC:E1:5D:10" )

for ENDERECO_MAC in ${ENDERECOS_COLETADOS[*]}
do 
        VALIDA=0
        for ARQUIVO in ${END_CONHECIDOS[*]} 
        do
               if [ "$ARQUIVO" = "$ENDERECO_MAC" ]
               then
                VALIDA=1

                fi
        done

        if [ $VALIDA -eq 0 ]
                then
                        echo " Endereço MAC desconhecido: $ENDERECO_MAC "
                fi

done    
echo " Verificação finalizada.
