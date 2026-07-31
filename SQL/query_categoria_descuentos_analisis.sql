SELECT 
    category AS categoria,
    CASE 
        WHEN discount = 0 THEN '1. Sin Descuento (0%)'
        WHEN discount <= 0.20 THEN '2. Descuento Moderado (1-20%)'
        ELSE '3. Descuento Agresivo (>20%)'
    END AS rango_descuento
    ,ROUND(SUM(sales), 2) AS facturacion
    ,ROUND(SUM(profit), 2) AS ganancia
    ,ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS margen_porcentaje
FROM sales
GROUP BY category, rango_descuento
ORDER BY category, rango_descuento;