INSERT INTO fact_sales (
  customer_key,
  date_key,
  product_key,
  store_key,
  seller_key,
  quantity,
  unit_price
)
SELECT
  c.customer_key,
  d.date_key,
  p.product_key,
  s.store_key,
  sl.seller_key,
  salesorderdetail.quantity,
  salesorderdetail.unitprice
FROM adventureworks.salesorderdetail
LEFT JOIN adventureworks.salesorderheader
  ON salesorderdetail.salesorderid = salesorderheader.salesorderid
LEFT JOIN adventureworks.customer
  AS c ON salesorderheader.customerid = c.customerid
LEFT JOIN adventureworks.store
  AS s ON salesorderheader.storeid = s.storeid
LEFT JOIN adventureworks.product
  AS p ON salesorderdetail.productid = p.productid
LEFT JOIN adventureworks.employee
  AS sl ON salesorderheader.salespersonid = sl.employeeid;
