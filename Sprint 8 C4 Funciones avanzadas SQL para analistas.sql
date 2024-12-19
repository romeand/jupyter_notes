SELECT
    name_store,
    COUNT(name) AS name_cnt,
    COUNT (DISTINCT name) AS name_uniq_cnt
FROM
    products_data_all
GROUP by
    name_store;

    Resultado
name_store	name_cnt	name_uniq_cnt
Four	992	32
Milk Market	1581	51
T-E-B	5952	192
Uncle Joe's Store	1550	50
Wise Penny	2046	66