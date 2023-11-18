 -- consulta 1
SELECT
    product_id,
    SUM(quantity) AS total_quantity,
    SUM(unit_price) * SUM(quantity) AS total_sales
FROM fact_orders
GROUP BY product_id;

 -- consulta 2

 SELECT
    seller_id,
    SUM(quantity) AS total_quantity,
    SUM(unit_price) * SUM(quantity) AS total_sales
FROM fact_orders
GROUP BY seller_id;

 -- consulta 3

 SELECT
    month_number,
    SUM(quantity) AS total_quantity,
    SUM(unit_price) * SUM(quantity) AS total_sales
FROM fact_orders
GROUP BY month_number;

 -- consulta 4

 SELECT
  product_key,
  SUM(cantidad) AS cantidad,
  SUM(valor * cantidad) AS total
FROM fact_sales
GROUP BY product_key;
