
# PARTIÇÕES NO HIVE


O Hive pode ajudar melhorar a busca particionando por valor em certa coluna e põe num mesmo arquivo os comúns!
Bucket: muuuuitas categorias diferentes (dividir ID)
Partition: poucas categorias diferentes (dividir estados)


```
    CREATE TABLE zipcodes(
    RecordNumber int,
    Country string,
    City string,
    Zipcode int)
    PARTITIONED BY(state string)
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ',';
```


Olha aqui! Tem uma partitioned by (state string) y ese state não é uma coluna da tabela como tal
Podem ser feitas partições desde várias colunas! 
Cuidar a ordem aqui se for o caso de ter várias colunas: (Zipcode,state)
Dinámico: Ele decide os valores diferentes das partes, por exemplo por stados então ele vai cortando pelos valores que a coluna estados tem. 

No estático a gente fala quais são as partes. A gente teria que carregar os dados pouco a pouco. 


## Isso aqui para que seja dinámico o particionamento:

```
set hive.exec.dynamic.partition.mode=nonstrict;
```

## Para fazer o insert.

```

insert overwrite table zipcodes partition(state)
        select
            RecordNumber int,
            Country string,
            City string,
            Zipcode int,
            state string
        from zipcodes_stage;
```

--------------------------------------------------------------------------------------------

# Bucking