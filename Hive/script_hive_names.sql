-- criando banco de dados covid se não existir

create database if not exists names;


use names;
-- removendo a tabela caso ela existir
drop table if exists names.name_data;

-- criando tabela
CREATE TABLE names.name_data(
	  idx int,
	  Id int,
	  Name string, 
	  Year int, 
	  Gender string, 
	  State string, 
	  Amount float)
row format delimited fields terminated BY ',' lines terminated BY '\n' 
tblproperties("skip.header.line.count"="1"); 


-- Load data
LOAD DATA INPATH '/user/cloudera/US_Baby_Names_right.csv' INTO TABLE names.name_data;