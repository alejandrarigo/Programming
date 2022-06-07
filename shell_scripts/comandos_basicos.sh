#!/bin/bash
##############################
############
# AUTHOR: ALEJANDRARIGO
#DATA DE CRIAÇÃO: 04.05.2022
############
####

echo 'Texto no console'

echo 'Criando pasta...'
mkdir -p diretorio-brq
# mkdir serve para criar uma pasta. 
# Se usarmos o parâmetro -p, permite criar
#   pastas não existentes ou não apresentar erros
#   quando a pasta já existe

ls -ls
# ls lista todas as pastas do diretório de interesse junto
#   com detalhes de horário de criação/modificação e suas permissões (parâmetro -l)

rm -r diretorio-brq
# rm deleta arquivos ou pastas de interesse.
# para deletar uma pasta, devemos passar o parâmetro -r (recursivo) 

tail -f arquivo.txt
# serve para mostrar as últimas linhas de um aquivo
#   e deixar o mesmo aberto para vermos as novas linhas
#   inseridas no final do arquivo
/dev/null é um buraco negro para erros aos quais podemos mandar mensagens de erro


sleep 3
# serve para "dormir" (parar console) por x segundos

touch arquivo.txt
# touch serve para criar um arquivo vazio ou para atualizar
#   a data de modificação do arquivo

# defini uma variável com o nome CONTADOR e iniciei o valor com 0
CONTADOR_UM=0
PASTA="/home/virtual/Desktop/brq"
#PASTA="~/Desktop/brq"

# imprimi o conteúdo da variável contador (não esquecer do $)
echo "O valor do CONTADOR é $CONTADOR_UM"

echo "usando LS"
ls $PASTA

DATAHORA=$(date +%Y-%m-%d---%H:%M)

echo "$DATAHORA usando PWD"
pwd


 man -> é o manual dos comandos linux
# Ex: man tail

 wc nomearchivo.txt word count
#conta linhas, frases caracteres de um arquivo

pipe | serve para pegar o resultado de um comando e inserir como entrada no seguinte. Por exemplo?
tail arquivo.txt | wc #ahi do tail desse archivo vai fazer a contagem

1>2 ele pega un comando que esta no 1 e joga no arquivo que esta no 2. Se o arquivo nao existe, ele cria.

tail prova1.txt >>prova2.txt # com >> ele não sobrescreve mas poe no final da linha
grep procura uma palabra num archivo
grep -i Grep primeiro_script.sh  insencitivo no distingue mayusculas y minusculas
grep -ic Grep primeiro_script.sh -ic conta quantas vezes aparece ai
grep -n Grep primeiro_script.sh diz todas as aparições e o numero da linha
grep -n ar.*o primeiro_script.sh começa em ar e acaba em o e não importa o que está no meio
grep -r frase Ele procura "frase" em todos os archivos dentro de uma pasta
grep -r frase  /home/virtual/ procura na pasta que eu quero

# wget faz download de um arquivo 
wget https://cursos.grandeporte.com.br/files/brq/big-data/datasets/cars1.csv faz o download de um arquivo
#gnumeric cambia .xls (excel) para .csv convert
egrep "a[r]*" prova2.txt #procura o que tenha a e r 0, 1 ou muitas ocurrencias
egrep "a[r]+" prova2.txt #procura o que tenha a e r em 1 ou muitas ocurrencias
egrep "a[r]?" prova2.txt #procura o que tenha a e r em 0 ou 1 ocurrencias

#TUDO PARA PARAR NO TERMINAL E CTRL + C

#diff mostra as diferencias entre dois archivos,  usualmente se faz web. tippo git

date ; echo "texto" #comandos em sequencia se o primeiro dar erro igual executa o segundo
date &&  echo "texto" #primeiro executa o primeiro e se nao da erro executa o segundo
 date &  echo "texto" #executa o primeiro em segundo plano

find -name 'a*' busca todos os arquivo e pastas que tem a, com nomes nisso


#para passaar argumentos: Sempre $0 é o nome do script

echo "Nome do script $0" 
echo "Quantidade de argumentos: $#" #Depois do nome do 
echo "Nome do script $1" 
echo "Mi nombre es $2" #Se quero passar um string então só devo colocar o argumento em "Aqui dentro" 
#se tenho uma variável que é um string e quero passar ele: sh primeiro_script.sh "$nome_variavel"
ps dice todo lo que está ocurriendo en la máquina ps -aux diz todo o que está tanto na virtual como no root
ps -aux | wc -l diz quántas lineas

ps aux | grep -c virtual      saida de ps aux entra no grep  ahi ele conta quantas linhas ele aparece

-f é de file e devolve true ou false se o archivo existe.

top quantidade de precessos computacionais que estão rolando
SCLM


## operators


 igualdade é -eq (equal)
-ge greater than or equal to
-le less than or equal to
echo $#
if [ $# -eq 0 ] #Preciso dos espaços entre os colchetes. 
then 
    echo "Nenhum argumento foi passado."
    exit 1 #ele sai do script de forma normal
fi

#Para criar um novo script e pegar as primeiras 11 linhas do documento sem por o primeiro cabeçalho (-q). 
head -11 -q primeiro_script.sh > setimo-script.sh
head  procura_arquivo.sh >> novo.sh


#######
chown troca o dono do archivo mudar o dono, passo o novo e o nome do arquivo
chown root:root sql.xlsx

sudo (super dono)
sudo chown root prova1.txt
sudo chown root prova1.txt

sudo faz toooooooooodooooooo
# DONO -GRUPO _ GUEST 
#chmod codigos nome_archivo.txt
# 0 = Sem permissão
# 1 = execução
# 2 = escrita
# 3 = 1+ 2 execução e escrita
# 4 = leitura
# 5 = 1+ 4 execução e leitura
# 6 = 2+4 leitura e escrita
# 7 = 1+2+4 todo

chmod +x nome_arquivo.algo #Adiciona +x em todos os tipos de usuarios

sudo su #aqui vai para superusuario


for i in $(seq 1 2 10) #para pegar um resultado do shell script
do 
    echo "$i"
done

for pasta in /home/virtual/Desktop/brq/*
do
    echo "$pasta"
    if [ -f $pasta ] #se o archivo existe 
    then 
        echo "o archivo existe $pasta"
        echo "O conteúdo é $(cat $pasta | wc -l) linhas"
    fi
    if [ -f ""]
done

#para crear uma seq de numeros de 1 a 5

#Usualmente é melhor para while

#for counter in {1..255}; do ping -c 1 10.0.0.$counter; done
j=0
while [ $j -le 5 ]
do  
    echo $j
    j=$(($j + 1))
done

:<<"SCLM"
#operação matematica sempre em parentesis
echo $((3*8)) isso até na terminal
echo $((3+8))
# $() sustituiçaõ do comando num script
SCLM

read -p "Informe um número:" NUM
echo "O número informado é $NUM"

