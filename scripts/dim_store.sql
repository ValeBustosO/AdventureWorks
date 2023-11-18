INSERT INTO adw_datawh.dim_store (
    
    store_id,
    store_name,
    store_city,
    store_country
)
SELECT
    store_id,
    name,
    city,
    country_code
    CONSTRAINT store_fk FOREIGN KEY (store_id) REFERENCES fact_orders(store_id)
FROM adventureworks.dimstore;
