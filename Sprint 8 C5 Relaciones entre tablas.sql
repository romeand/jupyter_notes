1.Busca valores NULL en el campo weight de la tabla products. Imprime los siguientes campos: name,units,weight.
SELECT
    name,
    units,
    weight
FROM
    products
WHERE
    weight IS NULL;

Resultado
name	units	weight
Park Manor Whole Milk (Limit 4), 1 gal	gal	
Silk Chocolate Protein Nut Milk, 1/2 gal	gal	
Central Market Organics 2% Reduced Fat Milk, 1/2 gal	gal	


2.Encuentra el número de valores NULL en el campo weight de la tabla products.
SELECT
    COUNT(name)
FROM
    products
where
    weight IS NULL;

Resultado
count
19

3.Encuentra pesos promedios de los productos, agrupados por unidades de medida (units). Guárdalos en el nuevo campo con el nombre avg_weight. Las columnas deben ir en este orden: avg_weight, unit.
SELECT
    AVG(weight::real) AS avg_weight,
    units
from
    products
GROUP by
    units;

Resultado
avg_weight	units
23.0705	oz
10	ct
12.0909	pk
0.650794	gal
1	%


4.Utiliza una consulta que contenga CASE para reemplazar manualmente NULL con los promedios que calculamos en la tarea anterior en cada grupo de units. Llama el campo resultante weight_full. Los valores de la columna deben ser cadenas e ir en el siguiente orden: name, weight_full.
SELECT
    name,
    CASE WHEN weight IS NULL
        AND units = '%' then
        '1.0'
    WHEN weight IS NULL
        AND units = 'pt' THEN
        '1.0'
    WHEN weight IS NULL
        AND units = 'ct' THEN
        '10.0'
    WHEN weight IS NULL
        AND units = 'qt' THEN
        '1.0'
    WHEN weight IS NULL
        AND units = 'gal' THEN
        '0.650793650793651'
    WHEN weight IS NULL
        AND units = 'pk' THEN
        '12.0909090909091'
    WHEN weight IS NULL
        AND units = 'oz' THEN
        '23.0705263269575'
    ELSE weight END AS weight_full
FROM
    products;

Resultado
name	weight_full
a2 Milk Whole Milk, 59 oz	59
Central Market Organics Reduced Fat 2% Milkfat Milk, 1 gal	1
Shamrock Farms Rockin Refuel Muscle Builder Chocolate Protein Milk Beverage, 12 oz	12
Dairy Pure Whole Milk, 1 gal	1

FUNCION LIKE

1.Aprendimos en la lección anterior que algunos productos tienen unidades de medida peculiares indicadas como porcentajes. Probablemente se ha filtrado un error en nuestros datos. 
Busca la cadena que tiene % en el campo de unidades. Imprime todas sus filas.

SELECT
    *
FROM
    products
where
    units LIKE '%!%%' ESCAPE '!';

Resultado
id_product	name	category	units	weight
71	Moo-Moo Chocolate 1% Low Fat Milk, 1 pt	milk	% 1


2.Encuentra todos los productos cuyos nombres contengan la palabra "Moo". Imprime todos los datos sobre ellos de la tabla products. 
Los nombres de los productos se almacenan en el campo name de la tabla products.

SELECT
    *
FROM
    products
where
    name LIKE '%Moo%';

Resultado
id_product	name	category	units	weight
43	TruMoo Chocolate Whole Milk, 1 pt	milk	pt	1
85	TruMoo Chocolate Whole Milk, 1/2 gal	milk	gal	0.5
10	M0-Moo Select Ingredients Lactose Free Fat Free Milk, 1/2 gal	milk	gal	0.5

INNER JOIN

1.Escribe una consulta para recuperar:

Números de transacciones: id_transaction de la tabla transactions
Nombres de categoría: category de la tabla products
Nombres de productos: name de la tabla products
La condición de unión es que los valores de los campos products.id_product y transactions.id_product sean iguales. Los nombres de los campos en la tabla resultante son id_transaction, category y name.

Imprime 10 filas. Ordena los datos en orden ascendente por número de transacción.

SELECT
    transactions.id_transaction AS id_transaction,
    products.category AS category,
    products.name AS name
FROM
    transactions
    INNER JOIN products ON products.id_product = transactions.id_product
ORDER BY
    id_transaction
LIMIT 10;
esultado
id_transaction	category	name
233673	milk	Nesquik Strawberry Low Fat Milk, 14 oz
233673	milk	Horizon Organic Whole Milk, 1 gal
233673	milk	Coconut Dream Original Coconut Drink, 32 oz

2.Los datos sobre las ventas y el clima se almacenan en diferentes tablas. En este caso nos ayudará INNER JOIN.

Para cada transacción, recupera los siguientes datos:

El día y la hora de la transacción (date) de la tabla de transactions.
Temperatura del aire (temp) de la tabla weather
Información sobre la lluvia (rain) de la tabla weather
El identificador de la transacción (id_transaction) de la tabla transactions
En la nueva tabla asigna a los campos los nombres date, temp, rain e id_transaction e imprímelos.

Ordena los datos en orden descendente por fecha de compra.
SELECT DISTINCT
    transactions.date AS date,
    weather.temp AS temp,
    weather.rain AS rain,
    transactions.id_transaction AS id_transaction
FROM
    transactions
    INNER JOIN weather ON CAST(weather.date AS date) = CAST(transactions.date AS date)
ORDER BY
    date DESC;

Resultado
date	temp	rain	id_transaction
2019-07-01 20:58:53	21	False	242893
2019-07-01 20:58:38	21	False	239878
2019-07-01 20:57:20	21	False	236962

3.Escribe una consulta para imprimir diferentes productos con precios (price) superiores a $5.
Selecciona diferentes nombres de productos (name) de la tabla products. Llama al campo resultante name y muéstralo.
Une los datos de la tabla products_stores a products utilizando el método INNER JOIN en el campo id_product.

SELECT DISTINCT
    products.name AS name
FROM
    products
    INNER JOIN products_stores ON products_stores.id_product = products.id_product
WHERE 
    products_stores.price > 5;

Resultado
name
Central Market Organics Whole Milk, 1 gal
Lactaid 100% Lactose Free 2% Reduced Fat Milk, 96 oz
Mo-Moo Select Ingredients Instant Nonfat Dry Milk, 25.6 oz
Horizon Organic 2% Reduced Fat Milk, 1 gal

4.Recupera transacciones (compras) de productos de la categoría 'butter' en un día: 20 de junio de 2019.
Selecciona los siguientes datos de las tablas transactions y products:
El día y la hora (date) de la tabla de transactions.
Número de transacción: id_transaction de la tabla transactions
Nombre de la categoría: category de la tabla products
Nombre del producto: name de la tabla products
Une los datos de la tabla products con transactions utilizando el método INNER JOIN en el campo id_product.

En la nueva tabla asigna a los campos los nombres date, id_transaction, category, name y muéstralos.

SELECT
    transactions.date AS date,
    transactions.id_transaction AS id_transaction,
    products.category AS category,
    products.name AS name
FROM
    transactions
    INNER JOIN products ON products.id_product = transactions.id_product
WHERE
    products.category = 'butter' AND CAST(transactions.date AS date) = '2019-06-20';

Resultado
date	id_transaction	category	name
2019-06-20 11:38:26	233819	butter	Мoo-Moo Select Ingredients Jalapeno Chipotle Finishing Butter, 3.5 oz
2019-06-20 12:29:14	233942	butter	Plugra European Style Salted Butter Tub, 8 oz
2019-06-20 12:29:14	233942	butter	Danish Creamery Unsalted European Style Butter, 8 oz
2019-06-20 19:41:58	234037	butter	Мoo-Moo Select Ingredients Maitre D Hotel Lemon Butter Finishing Butter, 3.5 oz

5.Imprime los precios de los productos cuyos pesos se miden en onzas ('oz') para el 13 de junio de 2019.
Recupera:
nombre del producto: name de la tabla products
categoría: category de la tabla products
unidades de medida: units de la tabla de products
peso: weight de la tabla products
precio: price de la tabla products_stores
Une las tablas products_stores y products usando el método INNER JOIN en el campo id_product.
Utiliza los siguientes nombres para lo que vas a recuperar: name, category, units, weight y price.

SELECT
    products.name AS name,
    products.category AS category,
    products.units AS units,
    products.weight AS weight,
    products_stores.price AS price
FROM
	products
INNER JOIN products_stores ON products_stores.id_product = products.id_product
WHERE
    products.units = 'oz' AND CAST(products_stores.date_upd AS date) = '2019-06-13';

Resultado
name	category	units	weight	price
Shamrock Farms Rockin Refuel Muscle Builder Chocolate Protein Milk Beverage, 12 oz	milk	oz	12	2.22
Fairlife 2% Chocolate Reduced Fat Milk, 52 oz	milk	oz	52	3.24
Promised Land Midnight Chocolate 2% Reduced Fat Milk, 12 oz	milk	oz	12	1.37

OUTER JOIN.LEFT JOIN

1.Escribe una consulta para seleccionar unívocos (distinct):

id_product de la tabla products
name de la tabla products
id_store de la tabla products_stores
Adjunta la tabla products_stores a la tabla products utilizando el método LEFT JOIN por el campo id_product.
Selecciona solo aquellas filas donde el valor id_store sea NULL. Si no existen tales filas, entonces sabemos que todos los productos están en venta en al menos un lugar.

Llama a los campos de la tabla resultante id_product, name y id_store

SELECT DISTINCT
    products.id_product AS id_product,
    products.name AS name,
    products_stores AS id_store
FROM
    products
    LEFT JOIN products_stores ON products_stores.id_product = products.id_product
WHERE
	products_stores IS NULL;

Resultado
The database doesntcontain entries that match your query

2.Como proveedor puedes ofrecer a las tiendas productos que no están vendiendo actualmente.
Imprime los nombres únicos de productos que nunca se han vendido en la tienda (id_store) cuyo identificador único es 3. 
1) Selecciona los nombres de productos únicos name de la tabla products. Guárdalos en la variable name.
2)  Utilizando LEFT JOIN, une la consulta externa con la subconsulta subquery por el campo id_product. 
Dentro de la subconsulta selecciona los id_product únicos de la tabla transactions donde el valor de id_store es 3.

SELECT
	products.name AS name
FROM
    products
    LEFT JOIN ( SELECT DISTINCT
                    transactions.id_product
        FROM
            transactions
        WHERE
            id_store = 3
            ) AS subquery ON subquery.id_product = products.id_product
WHERE
    subquery.id_product IS NULL;

Resultado
name
a2 Milk Whole Milk, 59 oz
Central Market Organics Reduced Fat 2% Milkfat Milk, 1 gal
Shamrock Farms Rockin Refuel Muscle Builder Chocolate Protein Milk Beverage, 12 oz
Dairy Pure Whole Milk, 1 gal
Fairlife Whole Milk, 52 oz

3.Escribe los nombres de los productos que no se estaban vendiendo en ninguna tienda el 11 de junio de 2019.
1) Selecciona los nombres de productos únicos name de la tabla products. Guárdalos en la variable name.
2) Utilizando LEFT JOIN, une la consulta externa con la subconsulta por el campo id_product. En la subconsulta, selecciona id_product y id_store para el 11 de junio de 2019.

SELECT
    products.name AS name
FROM
    products
    LEFT JOIN (
        SELECT
            id_product,
            id_store
        FROM
            transactions
        WHERE
            CAST(transactions.date AS date) = '2019-06-11') AS subquery ON subquery.id_product = products.id_product
where
    subquery.id_product IS NULL;

Resultado
name
Мoo-Moo Select Ingredients MooTopia Lactose Free 2% Reduced Fat Milk, 1/2 gal
Challenge Butter Lactose Free With Canola Oil, 15 oz

OUTER JOIN.RIGHT JOIN

1.Utiliza el método RIGHT JOIN para imprimir las fechas que no tienen entradas de transacciones pero tienen datos sobre el tiempo:
1) Recupera la fecha (date) de la tabla weather. Ten en cuenta que debe convertirse al tipo de datos correcto con CAST.
2) Une la tabla weather a la tabla transactions con el RIGHT JOIN por el campo date.
3) Haz un slice de datos en el bloque WHERE: selecciona solo las fechas vacías de la tabla transactions con la ayuda de IS NULL.
4) Imprime el campo date de la tabla resultante.

SELECT 
	CAST(weather.date AS date)
FROM
    transactions
    RIGHT JOIN weather ON CAST(weather.date AS date) = CAST(transactions.date AS date)
WHERE
    transactions.date IS NULL

Resultado
date
2019-07-02
2019-07-03

2.Cualquier consulta con LEFT JOIN puede ser escrita como RIGHT JOIN y al revés. Completa el ejercicio de la lección anterior con el método RIGHT JOIN.
Imprime los nombres únicos de los productos que nunca se han vendido en la tienda cuyo identificador único es 3.
1) Selecciona los nombres de productos únicos name de la tabla products. Guárdalos en la variable name.
2) Utilizando RIGHT JOIN, une la subquery con la consulta externa por el campo id_product. Dentro de la subconsulta selecciona los productos únicos id_product de la tabla transactions donde el valor de id_store es 3. 
3) En el bloque WHERE de la consulta externa, busca los valores NULL en id_product en la tabla subquery.

SELECT DISTINCT
    products.name AS name
FROM ( SELECT DISTINCT
		id_product,
        id_store
    FROM
        transactions
    WHERE
		id_store = 3
        ) AS subquery
    RIGHT JOIN products ON products.id_product = subquery.id_product
WHERE
    subquery.id_product IS NULL;

Resultado
name
a2 Milk 2% Reduced Fat Milk, 59 oz
a2 Milk Whole Milk, 59 oz
Blue Diamond Almonds Breeze Unsweetened Almond and Coconut Milk Blend, 32 oz

UNIR VARIAS TABLAS

1.Para cada transacción a partir del 5 de junio de 2019, imprime el número de transacción, el nombre de la tienda donde se realizó la compra, la categoría y el nombre del producto.

Selecciona: 
id_transaction de la tabla transactions
name_store de la tabla stores
category de la tabla products
name de la tabla products
JOIN la tabla transactions con la tabla products por el campo id_product. Después une transactions con stores por el campo id_store. Usa  INNER JOIN para ambas uniones.

En el bloque WHERE haz un slice de datos para la fecha '2019-06-05'.
Muestra los siguientes campos: id_transaction, name_store, category, name.

SELECT
    transactions.id_transaction AS id_transaction,
    stores.name_store AS name_store,
    products.category AS category,
    products.name AS name	
FROM
    transactions
    INNER JOIN products ON products.id_product = transactions.id_product
    INNER JOIN stores ON stores.id_store = transactions.id_store
WHERE
    CAST(transactions.date AS date) = '2019-06-05';

Resultado
id_transaction	name_store	category	name
233681	T-E-B	butter	Мoo-Moo Select Ingredients Chili Lime Finishing Butter, 3.5 oz
233754	Milk Market	milk	Horizon Organic Fat Free Milk, 1/2 gal
233754	Milk Market	milk	Horizon Organic Fat Free Milk, 1/2 gal

2.Recupera información sobre el tiempo que hacía y los nombres de los productos comprados para todos los días (incluso los días en que no hubo compras). Ordena los datos 1) en orden descendente por fecha y 2) en orden alfabético por el nombre del producto. Imprime las primeras 30 filas
Muestra la fecha (date), la temperatura del aire (temp), la precipitación (rain) y el nombre del producto (name).
Recupera:
date de la tabla weather
temp de la tabla weather
rain de la tabla weather
name de la tabla products
Utilizando el método LEFT JOIN, une transactions a la tabla weather por el campo date. Luego, une la tabla products a transactions por el campo id_product.

SELECT
	CAST(weather.date AS date) AS date,
    weather.temp AS temp,
    weather.rain AS rain,
    products.name AS name
FROM
    weather
    LEFT JOIN transactions ON CAST(transactions.date AS date) = CAST(weather.date AS date) 
    LEFT JOIN products ON products.id_product = transactions.id_product
ORDER BY 
	date DESC,
    name
LIMIT 30;

Resultado
date	temp	rain	name
2019-07-03	20	False	
2019-07-02	25	False	
2019-07-01	21	False	a2 Milk 2% Reduced Fat Milk, 59 oz
2019-07-01	21	False	a2 Milk 2% Reduced Fat Milk, 59 oz

3.Escribe una consulta para imprimir las transacciones (incluidos los nombres de los productos) realizadas los días en los que no llovió.
Selecciona el campo id_transaction de la tabla transactions y guárdalo en la variable id_transaction. Guarda el campo name de la tabla products en la variable name. Une la tabla transactions con products por el campo id_product. Después une la tabla transactions con weather por el campo date. No olvides convertir los valores de date de las tablas transactions y weather al tipo de fecha utilizando la función CAST. Las columnas deben aparecer en el siguiente orden: id_transaction, name.
Toma un slice de datos en el bloque WHERE. La condición para el slice es: weather.rain = False.

SELECT
    transactions.id_transaction AS id_transaction,
    products.name AS name
FROM
    transactions
    INNER JOIN products ON products.id_product = transactions.id_product
    INNER JOIN weather ON CAST(weather.date AS date) = CAST(transactions.date AS date)
WHERE
    weather.rain = False

Resultado
id_transaction	name
243410	Ripple Dairy Free Chocolate Pea Milk, 48 oz
242853	Polar Premium Organic Coconut Milk, 13.5 oz
242598	So Delicious Dairy Free Unsweetened Coconut Milk Beverage, 1/2 gal

AGREGACION EMPAREJADA CON JOIN

1.Encuentra el número total de productos y el número de productos únicos para cada transacción. Imprime 10 filas que contengan números de transacción, el número de productos comprados y el número de productos únicos en cada compra. Llama a los campos id_transaction, name_cnt, name_uniq_cnt respectivamente.
Selecciona los valores id_transaction de la tabla transactions. Aplica la función de agregación COUNT a la columna name de la tabla products. Después aplica la función de agregación COUNT(DISTINCT ) a la columna name de la tabla products.
Utiliza INNER JOIN para unir las tablas transactions y products por el campo id_product.
Al final, agrupa los valores por id_transaction.

SELECT 
	transactions.id_transaction AS id_transaction,
    COUNT(products.name) AS name_cnt,
    COUNT(DISTINCT products.name) as name_uniq_cnt
FROM
    transactions
    INNER JOIN products ON products.id_product = transactions.id_product
GROUP BY 
    id_transaction
LIMIT 10;

Resultado
id_transaction	name_cnt	name_uniq_cnt
233673	3	3
233674	4	4
233675	1	1
233676	1	1

2.Averigua qué transacciones incluyeron productos no únicos (más de un producto del mismo tipo). Muestra el número de transacción, el número de productos y el número de productos únicos. Llama a los campos id_transaction, name_cnt, name_uniq_cnt respectivamente.
Selecciona los valores id_transaction de la tabla transactions. Aplica la función de agregación COUNT a la columna name de la tabla products. Después aplica la función de agregación COUNT(DISTINCT ) a la columna name de la tabla products.
Utiliza INNER JOIN para unir las tablas transactions y products por el campo id_product.
Utiliza la cláusula HAVING con la condición de que el número de productos (products.name) no sea igual al número de productos únicos (DISTINCT products.name). Utiliza la función COUNT para obtener los totales.

SELECT 
    transactions.id_transaction AS id_transaction,
    COUNT(products.name) AS name_cnt,
    COUNT(DISTINCT products.name) AS name_uniq_cnt
FROM
    transactions
    INNER JOIN products ON products.id_product = transactions.id_product
GROUP BY
    id_transaction
HAVING
    COUNT(products.name) != COUNT(DISTINCT products.name);

Resultado
id_transaction	name_cnt	name_uniq_cnt
233689	5	4
233727	2	1
233728	2	1
233754	3	2
233757	4	3

3.Encuentra cuántas transacciones se realizaron en días lluviosos o soleados. Crea una tabla con los campos precipitación (rain) y el número de transacciones (uniq_transactions).
Selecciona los valores de los campos rain de la tabla weather. Cuenta el número de valores únicos en la columna id_transaction de la tabla transactions utilizando COUNT(DISTINCT ).
Agrupa los datos por los valores de rain. Une las tablas transactions y weather por el campo date utilizando INNER JOIN.

SELECT 
	weather.rain AS rain,
    COUNT(DISTINCT transactions.id_transaction) AS uniq_transactions
FROM
    transactions
    INNER JOIN weather ON CAST(weather.date AS date) = CAST(transactions.date AS date)
GROUP by
    rain;

Resultado
rain	uniq_transactions
False	6254
True	3644

4.Muestra la temperatura del aire y el número de transacciones. Ordena los resultados por la fecha en el orden ascendente (el primero va primero).

En el bloque SELECT:

Convierte los valores date en la tabla weather al tipo de datos de fecha con la función CAST y guárdalos en el campo date
Selecciona los valores temp de weather y guárdalos como temp
Busca el número de valores únicos en la columna id_transaction de la tabla transactions y guárdalo como uniq_transactions
Utiliza LEFT JOIN para unir las tablas transactions y weather por el campo date.

Agrupa los resultados por la fecha y temperatura y ordénalos por la fecha.

SELECT
    CAST(weather.date AS date) AS date,
    weather.temp AS temp,
	COUNT(DISTINCT transactions.id_transaction) AS uniq_transactions
FROM
    weather
    LEFT JOIN
        transactions ON CAST(transactions.date AS date) = CAST(weather.date AS date)
GROUP BY 
	CAST(weather.date AS date),
    temp
ORDER BY 
	date;

Resultado
date	temp	uniq_transactions
2019-06-01	15	330
2019-06-02	17	375
2019-06-03	20	341
2019-06-04	22	358

5.Para cada transacción, encuentra el precio total de compra así como el número de productos comprados.
Selecciona la columna id_transaction de la tabla transactions.
Calcula la suma de los valores en la columna price en la tabla products_stores. Guárdala en el campo total.
Busca el número de valores en la columna id_product de products_stores. Guárdalo como amount.
Utiliza LEFT JOIN para unir products_stores a la tabla transactions con tres condiciones al mismo tiempo:
1) Los valores en las columnas products_stores.date_upd y transactions.date son iguales. Convierte los valores al tipo de datos correcto con CAST.
2) Los valores en las columnas products_stores.id_product y transactions.id_product son iguales.
3) Los valores en las columnas products_stores.id_store y transactions.id_store son iguales.
¡Aviso importante! Puedes escribir tres condiciones después de ON. Simplemente conéctalos con dos ANDs.
Agrupa los datos por los valores de la columna id_transaction de transactions.
Imprime solo las transacciones de más de 35$. Indica la siguiente condición en HAVING: SUM(products_stores.price) > 35.
El orden de las columnas debe ser: id_transaction, total, amount.

SELECT
    COUNT(products_stores.id_product) AS amount,
    SUM(products_stores.price) AS total,
    transactions.id_transaction AS id_transaction
FROM
    transactions
        LEFT JOIN products_stores ON CAST(products_stores.date_upd AS date) = CAST(transactions.date AS date) AND products_stores.id_product = transactions.id_product AND products_stores.id_store = transactions.id_store
GROUP BY
    transactions.id_transaction
having
    SUM(products_stores.price) > 35
ORDER BY
id_transaction,
total,
amount;

Resultado
amount	total	id_transaction
5	35.56	233911
5	36.66	234003
4	41.16	235251
5	36.85	236354
5	39.02	237270

UNIR DECLARACIONES

