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

