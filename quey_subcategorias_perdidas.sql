
SELECT 
    category AS categoria
    ,sub_category AS subcategoria
    ,ROUND(SUM(sales), 2) AS facturacion_total
    ,ROUND(SUM(profit), 2) AS ganancia_total
    ,ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS margen_porcentaje
FROM sales
WHERE discount > 0.20
GROUP BY category, sub_category
HAVING ganancia_total < 0
ORDER BY ganancia_total ASC;