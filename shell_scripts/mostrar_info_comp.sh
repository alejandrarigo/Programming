#!/bin/bash
##############################
############
# AUTHOR: ALEJANDRARIGO
#DATA DE CRIAÇÃO: 04.05.2022
############
####
# DESCRIÇÃO: Mostra a info solicitada aqui hostname, date, uso do cpu, uso de memoria, uso de disco
# ARGUMENTOS: 
###################################


while true
do
    HOSTNAME=$(hostname)
    DATET=$(date "+%Y-%m-%d %H:%M:%S")
    CPUUSAGE=$(top -b -n 2 -d1 | grep -ic "Cpu(s)" | tail -n1 | awk '{print $2}' |awk -F. '{print $1}')
    MEMUSAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    DISKUSAGE=$(df -h / | awk '{print $5}' |tail -n 1 |sed 's/%//g')
    echo "DATE: $DATET"
    echo "CPU: $CPUUSAGE"
    echo "MEMORY: $MEMUSAGE"
    echo "DISCO: $DISKUSAGE %"
    echo "========="
    sleep 5
done
