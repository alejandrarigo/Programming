#!/bin/bash

#baixar o csv é bom por aqui

# copiar o csv do COVID da nossa maquina para o HDFS
echo 'copiando o arquivo covid_19_data.csv para o HDFS'
hdfs dfs -put US_Baby_Names_right.csv /user/cloudera

# executar scripts hive para criar o banco de dados, tabelas e importacao dos dados

echo 'executando scripts de criacao de tabelas e ingestao de dados no HIVE'
hive -f script_hive_names.sql

 exportar os dados do Hive para um csv

echo 'Consulta 1: Existem mais nomes masculinos ou femininos?'  >>  result.txt

hive -e 'SELECT COUNT(Distinct n.name) as Total, n.gender as Genero FROM names.name_data n GROUP BY n.Gender ORDER BY Total desc' >>  result.txt

echo 'Consulta 2: Qual os 5 primeiros nomes com mais "uso" no dataset?'  >>  result.txt

hive -e 'SELECT sum(n.amount) as Total, n.name as Nome FROM names.name_data n GROUP BY n.name ORDER BY Total desc Limit 5'  >>  result.txt

echo 'Consulta 3: Quantas vezes Jacob foi utilizado?'  >>  result.txt

hive -e "SELECT sum(n.amount) as Total FROM names.name_data n WHERE n.name = 'Jacob'"  >>  result.txt