INSERT INTO adw_datawh.dim_product (
    
    product_id,
    product_name,
    product_description,
    product_subcategory,
    product_category
)
SELECT
    product_id,
    name,
    description,
    subcategory_id,
    category_id
    CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES fact_orders(product_id)
FROM adventureworks.product;

