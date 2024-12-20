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

SELECT 
	COUNT(name) AS name_cnt,
    category,
    date_upd::date AS update_date
FROM
    products_data_all
WHERE
    date_upd = '2019-06-05'
GROUP BY 
    category,
    update_date
ORDER BY
    name_cnt;

Resultado
name_cnt	category	update_date
61	butter	2019-06-05
330	milk	2019-06-05

SELECT
    date_upd::date AS update_date,
    name_store,
    category,
    COUNT(DISTINCT name) AS uniq_name_cnt
FROM
    products_data_all
WHERE
    name_store = 'T-E-B'
    AND date_upd::date = '2019-06-30'
GROUP BY
    update_date,
    name_store,
    category
ORDER BY
    uniq_name_cnt DESC;

   Resultado
update_date	name_store	category	uniq_name_cnt
2019-06-30	T-E-B	milk	162
2019-06-30	T-E-B	butter	30

SELECT
    name,
	MAX(price) AS max_price
FROM
    products_data_all
GROUP BY 
    name
ORDER BY
    max_price DESC
LIMIT 5;

Resultado
name	max_price
Nestle Nido Kinder Powdered Milk Beverage 1+, 56.3 oz	17.79
Horizon Organic DHA Omega-3 Chocolate Lowfat Milk, 12 pk	12.74
Horizon Organic Chocolate Lowfat Milk, 12 pk	12.5
Horizon Organic Vanilla Lowfat Milk, 12 pk	12.48
Horizon Organic Lowfat Milk, 12 pk	12.38

PROCESAR DATOS DENTRO DE UNA AGRUPACIÒN

SELECT 
    name,
	MAX(price) AS max_price
FROM
    products_data_all
GROUP BY
	name
HAVING
    MAX(price) > 10
Resultado
Resultado
name	max_price
Nestle Nesquik Chocolate Lowfat Milk, 16 pk	11.96
Horizon Organic DHA Omega-3 Chocolate Lowfat Milk, 12 pk	12.74
Horizon Organic Chocolate Lowfat Milk, 12 pk	12.5
Horizon Organic Vanilla Lowfat Milk, 12 pk	12.48
Nestle Nido Kinder Powdered Milk Beverage 1+, 56.3 oz	17.79
Horizon Organic Lowfat Milk, 12 pk	12.38

SELECT
    date_upd::date AS update_date,
    name_store,
    COUNT(name) AS name_cnt
FROM
    products_data_all
WHERE
    date_upd::date = '2019-06-03'
    AND units = 'oz'
    AND weight::real > 5
GROUP BY
    update_date,
    name_store
HAVING
    COUNT(name) < 20;

Resultado

Resultado
update_date	name_store	name_cnt
2019-06-03	Four	14
2019-06-03	Milk Market	15
2019-06-03	Uncle Joes Store	18
2019-06-03	Wise Penny	18

De nuevo, sigamos trabajando con la tabla products_data_all.
Escribe una consulta para encontrar la cantidad de productos únicos para cada tienda (name_store) 
y llama a la variable name_uniq_cnt. Encuentra las tres tiendas con la menor cantidad de productos 
(ordénalas en orden ascendente) entre las tiendas que tienen más de 30 productos únicos. 
Imprime el nombre de cada tienda y la cantidad de productos únicos que ofrece.

SELECT 
	name_store,
    COUNT (DISTINCT name) AS name_uniq_cnt
FROM
    products_data_all
GROUP BY
    name_store
having
    COUNT(DISTINCT name) > 30;
ORDER BY
    name_uniq_cnt ASC
    LIMIT 3;
Resultado
name_store	name_uniq_cnt
Four	32
Uncle Joes Store	50
Milk Market	51
