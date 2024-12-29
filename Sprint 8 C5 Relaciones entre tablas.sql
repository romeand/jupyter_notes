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
Shamrock Farms Rockin' Refuel Muscle Builder Chocolate Protein Milk Beverage, 12 oz	12
Dairy Pure Whole Milk, 1 gal	1