# Hive: Console 


## To run the hive console just write: 


```
hive
```

## Here an example of a query in Hive between ' ' and the writting the result in a file c.csv


```

hive -e 'SELECT * FROM database.tabela WHERE Condition' > c.csv 

```


## Another example using pipe. In this case we are aletring the format of the resulting table doing a replacement of TAB = \t for the simbol , 

```
hive -e 'SELECT * FROM database.tabela WHERE Condition' | sed 's/[\t]/,/g'  >  c.csv 
```

sed 's/[\t]/,/g' replace o que é tab por ,


