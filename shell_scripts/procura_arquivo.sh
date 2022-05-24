#!/bin/bash
##############################
############
# AUTHOR: ALEJANDRARIGO
#DATA DE CRIAÇÃO: 04.05.2022
############
####
# DESCRIÇÃO: Procura de arquivo numa pasta
# ARGUMENTOS: precisa do nome do archivo e do texto a ser procurado

if [ $# -le 1 ]
then
    echo "Nome do archivo e texto a procurar são obrigatórios."
    exit 1
fi 

CONTADOR=$(grep -ic -n $2.* $1) #conta cuantas vezes aparece
grep -n $2 $1

if [ $CONTADOR -eq 0 ]
then 
    echo "Nenhuma ocurrência da palavra."
elif [ $CONTADOR -eq 1 ]
then 
    echo "Encontrou-se $CONTADOR ocorrência."
else
    echo "Encontrou-se $CONTADOR ocorrências." 
fi
