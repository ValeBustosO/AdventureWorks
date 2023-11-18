INSERT INTO adw_datawh.dim_seller (
    
    seller_key,
    seller_id,
    seller_first_name,
    seller_last_name,
    seller_city,
    seller_country,
    seller_gender
)
SELECT
    employee_id,
    first_name,
    last_name,
    addressline1,
    city,
    country,
    gender
    CONSTRAINT seller_fk FOREIGN KEY (seller_id) REFERENCES fact_orders(employee_id)
FROM adventureworks.dimemployee;