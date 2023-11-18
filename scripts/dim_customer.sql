INSERT INTO adw_datawh.dim_customer (
    
    customer_key,
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_address,
    customer_city,
    customer_country,
    customer_occupation,
    customer_gender
)
SELECT
    customer_id,
    first_name,
    last_name,
    address,
    city,
    country,
    occupation,
    gender
    CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES fact_orders(customer_id)
FROM adventureworks.customers;