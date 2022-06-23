
# Hive - First Chapter


To create the database:

```

create database nome_database

```

--- criamos uma tabela que se chama clientes que está separada por virgula
--- aqui estamos criando uma tabela externa, os dados não estão gerenciados pelo hive.
CREATE EXTERNAL TABLE CLIENTES (idcliente int, cnh string, cpf string, validadecnh date, nome string, datacadastro date, datanascimento date, telefone string, status string) 
row format delimited fields terminated by ', ' STORED as TEXTFILE;
-------------

A diferencia entre tabela interna (tabela normal) e externa é que quando é externa e eu drop a tabela o archivo não vai embora mas se for interna quando eu deletar a tabela vai embora o archivo que usei para carregar. 


CREATE TABLE ratings (
  userid INT, 
  movieid INT,
  rating INT, 
  tstamp STRING
) ROW FORMAT DELIMITED
FIELDS TERMINATED BY '#'
STORED AS TEXTFILE;


CREATE TABLE `covid.covid_19_2`(
	  `sno` int, 
	  `observationdate` string, 
	  `province` string, 
	  `country` string, 
	  `lastupdate` string, 
	  `confirmed` int, 
	  `deaths` int, 
	  `recovered` int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)   ;

Aqui estamos dizendo que o separador é , e o quoteChar é aspas duplas ". ahí não quebra.


--- MUCHO CUIDADO DE DONDE CORRES LAS COSAS. ASEGURATE QUE EL BANCO QUE ESTÁS USANDO ES EL CORRECTO.
--- aqui estamos carregando os dados do arquivo clientes.csv que já estava no HDFS para a tabela clientes do Hive que acabamos de criar
LOAD DATA INPATH '/locacao/clientes.csv' INTO TABLE CLIENTES;







--- vamos ver o que tem a tabela clientes
SELECT * FROM CLIENTES;

Explain na frente de uma query ele da um explain das coisas que faz primeiro

--- ELE PODE TER GUARDADO EM OUTRA PASTA: USER/HIVE/WAREHOUSE
--- MESMA COISA COM AS OUTRAS TABELAS



CREATE EXTERNAL TABLE VEICULOS (idveiculo int, dataaquisicao date, ano int , modelo string,
placa string, status string, diaria double) row format delimited fields terminated by ', ' STORED as TEXTFILE;



LOAD DATA INPATH '/locacao/veiculos.csv' INTO TABLE VEICULOS;



SELECT * FROM VEICULOS;





--- MESMA COISA QUE O ANTERIOR

CREATE EXTERNAL TABLE DESPACHANTES (iddespachante int, nome string, status string , filial string) row format delimited fields terminated by ', ' STORED as TEXTFILE;



LOAD DATA INPATH '/locacao/despachantes.csv' INTO TABLE DESPACHANTES;



SELECT * FROM DESPACHANTES;


-------------------------------------------------
Para ver como está a tabela se é gerenciada ou não pelo hive. Um describe de uma tabela


describe formatted nome_banco.nome_tabela;

-------------------------------------------------------


CREATE EXTERNAL TABLE LOCACAO (idlocacao int, idcliente int, iddespachante int , idveiculo int, datalocacao date, dataentrega date, total double) row format delimited fields terminated by ', ' STORED as TEXTFILE;



LOAD DATA INPATH '/locacao/locacao.csv' INTO TABLE LOCACAO;

PAARA NAO PEGAR A PRIMEIRA LINHA DE CABEÇALHO PÕE ISSO NO FINAL
CREATE TABLE nome_tabela
  ( 
     name STRING, 
     id   INT 
  ) FORMAT BLA BLA
row format delimited fields terminated BY '\t' lines terminated BY '\n' 
tblproperties("skip.header.line.count"="1"); 



Para depois de lida a tabela com cabeçalho tirar ele da tabela:
-- REMOVENDO A PRIMEIRA LINHA DA TABELA
ALTER TABLE db_births.tb_babies SET TBLPROPERTIES ("skip.header.line.count"="1");

OU DEPOIS FAZ UM ALTER TABLE

ALTER TABLE dbsus.tb_covid SET TBLPROPERTIES ("skip.header.line.count"="1");

Para datas puede ayudar esse Replace para reemplazar /por -

select '2022-04-05', year('2022-04-05'), month('2022-04-05'), 
    day( regexp_replace('2022/04/05','/','-' ) ),
    dayofmonth( regexp_replace('2022/04/05','/','-' ) );






select distinct modelo from VEICULOS;

select * from VEICULOS where status <> 'Disponivel';

select * from locacao inner join despachantes on (locacao.iddespachante = despachantes.iddespachante);

select (veic.modelo), sum(loc.total) from locacao loc inner join veiculos veic on ( loc.idveiculo = veic.idveiculo) group by veic.modelo;



select (veic.modelo), sum(loc.total) from locacao loc inner join veiculos veic on ( loc.idveiculo = veic.idveiculo)

	inner join despachantes desp on (desp.iddespachante = loc.iddespachante)

	group by veic.modelo, desp.nome;

	

select (veic.modelo), sum(loc.total) from locacao loc inner join veiculos veic on ( loc.idveiculo = veic.idveiculo)

	inner join despachantes desp on (desp.iddespachante = loc.iddespachante)

	group by veic.modelo, desp.nome

	having sum(loc.total ) > 5000;	


## Final remarks:

--- Temos todo numa pasta do HDFS. Agora dentro do hive abrimos uma query e ali temos quecriar o data base
--- isso qui está em linguagem java. Os tipos e dados são muito mais parecidos para o java que para o SQL
--- Ele mostra como criar a tabela covid_19 de una vez.
show create table movilens.covid_19;

hdfs dfs -rm -r /user/root/



mysql -u root -p 



password: hortonworks1





CREATE USER 'fabrizio'@'localhost' IDENTIFIED BY 'fgv';

GRANT ALL PRIVILEGES ON *.* TO 'fabrizio'@'localhost';

FLUSH PRIVILEGES;



SOURCE employees.sql



sqoop import --connect jdbc:mysql://localhost:3306/employees \

--username root \

--password hortonworks1 \

--table employees \

--split-by emp_no \

--hive-import \

--create-hive-table \

--hive-table locacao.employees \

--m  1;







sqoop import-all-tables --connect jdbc:mysql://localhost/employees \
--username root \
--password hortonworks1 \
--hive-import \
--hive-overwrite \
--hive-database employees \
--create-hive-table \
--m 1;

