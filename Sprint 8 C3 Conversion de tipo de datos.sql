SELECT
    AVG(weight::real) AS average
	
FROM
    products_data_all
where
    units = 'oz'
    Resultado
average
23.5541

SELECT
    MAX(CAST(weight AS real)) AS max_weight
	
FROM
    products_data_all
WHERE
   category = 'milk' 
   Resultado
max_weight
96

SELECT
    CAST (date AS date) AS date_no_time
FROM
    transactions;
    Resultado
date_no_time
2019-06-26
2019-06-26
2019-06-26
2019-06-12

SELECT 
    MAX(CAST(date AS date)) AS max_date,
    MIN(CAST(date AS date)) AS min_date
FROM
    transactions;
    Resultado
max_date	min_date
2019-07-01	2019-06-01