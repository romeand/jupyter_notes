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
Uncle Joes Store	1550	50
Wise Penny	2046	

SELECT 
	category,
    MAX(CAST(weight AS real)) AS max_weight
FROM
    products_data_all
	
GROUP BY 
    category;

Resultado
category	max_weight
milk	96
butter	2

SELECT 
    name_store,
    AVG(price) AS average_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM
    products_data_all
GROUP BY
  name_store

ultado
name_store	average_price	max_price	min_price
T-E-B	3.3352	17.77	0.69
Uncle Joes Store	3.37357	17.79	0.88
Four	3.74773	12.5	1.29
Wise Penny	3.35713	12.38	0.7
Milk Market	3.39367	12.41	0.89

SELECT
    name,
    MAX(price) - MIN(price) AS max_min_diff
FROM
    products_data_all
WHERE
    category = 'milk'
    AND date_upd::date = '2019-06-10'
GROUP BY
    name;
    Resultado
name	max_min_diff
a2 Milk 2% Reduced Fat Milk, 59 oz	0.23
a2 Milk Whole Milk, 59 oz	0.23
A Taste of Thai Lite Coconut Milk, 13.5 oz	0.05
A Taste of Thai Unsweetened Coconut Milk, 13.5 oz	0.04

ORDENAR DATOS

