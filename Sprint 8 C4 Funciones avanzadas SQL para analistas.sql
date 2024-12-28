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

Operadores y funciones para trabajar con fechas
SELECT 
    EXTRACT (HOUR FROM date) AS hours
FROM
    transactions;

SELECT 
    EXTRACT (HOUR from date) AS hours,
    COUNT(id_product) AS cnt
FROM
    transactions
GROUP BY
    hours
ORDER BY
    hours;

    SELECT 
    EXTRACT(DAY from date) AS days,
    COUNT(id_product) AS cnt
FROM
    transactions
GROUP by
    days
ORDER BY
    days;

    SELECT
    DATE_TRUNC('day', date) AS date_month,
    COUNT(id_product) AS cnt
FROM
    transactions
GROUP by
    date_month
ORDER by
    date_month;

    SELECT 
    id_product
FROM 
	products_data_all
where (category = 'milk'
    AND price > 17) 
    OR (category = 'butter' AND price > 9);

id_product
97
97
97
97
97
97
171
97

SELECT DISTINCT
    user_id
FROM 
	transactions
WHERE 
    id_product in
	(SELECT 
	id_product 
	FROM 
	products_data_all
	WHERE 
	(category='milk' AND  price > 17) OR 
	(category='butter' AND price > 9));
    Resultado
user_id
350
874
940
815
508
366
823

SELECT
    DATE_TRUNC('day', date) AS trunc_date,
    COUNT(DISTINCT id_transaction) AS transactions_per_day
FROM
	transactions
GROUP by
    trunc_date;

    Resultado
trunc_date	transactions_per_day
2019-06-01 00:00:00	330
2019-06-02 00:00:00	375
2019-06-03 00:00:00	341
2019-06-04 00:00:00	358

SELECT 
   EXTRACT(WEEK FROM SUBQ.trunc_date) AS week_number,
    AVG(SUBQ.transactions_per_day) AS avg_week_transaction
FROM
	(SELECT
        COUNT(DISTINCT id_transaction) AS transactions_per_day,
        DATE_TRUNC('day', date) AS trunc_date
    FROM
        transactions
	GROUP BY
        trunc_date) AS SUBQ
GROUP by
    week_number;
    Resultado
week_number	avg_week_transaction

Resultado
23	332.429
26	323
24	330
22	352.5
27	348
25	324.571

SELECT
    name AS product_name,
    name_store AS store_name,
    category AS category,
    price AS product_price,
    price / AVG(price) OVER (PARTITION BY category, name_store) AS product_mul
FROM
    products_data_all
ORDER BY
    id_product;

    roduct_name	store_name	category	product_price	product_mul
a2 Milk Whole Milk, 59 oz	Uncle Joes Store	milk	3.56	1.01888
a2 Milk Whole Milk, 59 oz	T-E-B	milk	3.45	1.02882
a2 Milk Whole Milk, 59 oz	Uncle Joes Store	milk	3.43	0.981675
a2 Milk Whole Milk, 59 oz	Uncle Joes Store	milk	3.39	0.970227

SELECT distinct
    name_store AS store_name,
    date_upd::date AS sale_date,
    category AS category,
    SUM(price) OVER (
    PARTITION by
        name_store, category, date_upd
    ) * 100 / SUM(price) OVER (
        PARTITION by
            name_store, date_upd
    ) AS percent
FROM
    products_data_all
WHERE
    date_upd::date BETWEEN '2019-06-01'
    AND '2019-06-06'
ORDER by
    date_upd::date,
    name_store;

    store_name	sale_date	category	percent
Four	2019-06-01	butter	16.7999
Four	2019-06-01	milk	83.2001

SELECT 
    name_store AS store_name,
    category AS category,
    name AS product_name,
    price,
    SUM(price) OVER (
        PARTITION BY 
            category
        ORDER by
            id_product
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS category_accum,
    SUM(price) OVER (
        ORDER by
            id_product
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS store_accum
FROM
    products_data_all
where
    date_upd = '2019-06-02'
    AND name_store = 'Four'
ORDER BY
    id_product;

    Resultado
store_name	category	product_name	price	category_accum	store_accum
Four	milk	Borden Super Chox Chocolate Drink, 1 gal	2.38	2.38	2.38
Four	milk	Fairlife 2% Chocolate Reduced Fat Milk, 52 oz	3.16	5.54	5.54
Four	milk	Мoo-Moo Select Ingredients Fat Free Milk, 1 gal	2.28	7.82	7.82

SELECT DISTINCT
    name_store AS store_name,
    category AS category,
    date_upd:: AS sale_date
    name,
    price,
    RANK() OVER (PARTITION BY name_store,category ORDER BY price) AS rank,
FROM
    products_data_all
where
    date_upd::date = '2019-06-02'
ORDER by
    store_name,
    category,
    rank;

    Resultado
store_name	category	sale_date	name	price	rank
Four	butter	2019-06-02	Land O Lakes Honey Butter Spread, 6.5 oz	1.87	1
Four	butter	2019-06-02	Pillsbury Butter Flake Crescent Dinner Rolls, 8 ct	1.97	2
Four	butter	2019-06-02	Nabisco Ritz Peanut Butter Cracker Sandwiches, 8 ct	2.86	3
