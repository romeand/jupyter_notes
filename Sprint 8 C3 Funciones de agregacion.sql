SELECT 
    COUNT(*) AS cnt	
FROM
    products_data_all;

    12121

    SELECT
    COUNT(*) AS cnt,
    COUNT(name) AS name_cnt,
    COUNT(DISTINCT name) AS name_uniq_cnt
    
FROM
    products_data_all;

    cnt	name_cnt	name_uniq_cnt
12121	12121	192

SELECT 
	AVG(price) AS average
FROM
    products_data_all;
Resultado
average
3.3852

SELECT 
    AVG(price) AS average
FROM
    products_data_all
WHERE
    name = 'Borden Whole Milk, 1 gal'
    AND name_store = 'Wise Penny'
    Resultado
average
3.52871

SELECT
    SUM(price) AS total_cost
FROM
    products_data_all
WHERE
    name_store = 'T-E-B'
    Resultado
total_cost
19851.1

SELECT
    MAX(price) AS max_price
	
FROM
    products_data_all;
    Resultado
max_price
17.79

SELECT 
	MAX(price)- MIN(price) AS max_min_diff
FROM
    products_data_all
where
    name = 'Meyenberg Goat Milk, 1/2 gal'
    AND name_store = 'Milk Market'

    Resultado
max_min_diff
0.63