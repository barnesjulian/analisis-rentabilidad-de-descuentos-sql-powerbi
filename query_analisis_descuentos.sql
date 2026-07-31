SELECT 
    CASE 
        WHEN discount = 0 THEN '1. Sin Descuento (0%)'
        WHEN discount <= 0.20 THEN '2. Descuento Moderado (1-20%)'
        ELSE '3. Descuento Agresivo (>20%)'
    END AS rango_descuento
    ,COUNT(DISTINCT order_id) AS total_pedidos
    ,SUM(quantity) AS unidades_vendidas
    ,ROUND(SUM(sales), 2) AS facturacion_total
    ,ROUND(SUM(profit), 2) AS ganancia_total
    ,ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS margen_ganancia_porcentaje
FROM sales
GROUP BY rango_descuento
ORDER BY rango_descuento;