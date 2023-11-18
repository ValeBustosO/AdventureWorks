CREATE DATABASE IF NOT EXISTS adw_datawh;
USE adw_datawh;

-- Dimensión Cliente
-- Tabla dim_customer
CREATE TABLE IF NOT EXISTS dim_customer (

  customer_key INT(8) NOT NULL AUTO_INCREMENT,
  customer_id INT(8) NULL DEFAULT NULL,

  customer_first_name VARCHAR(45) NULL DEFAULT NULL,
  customer_last_name VARCHAR(45) NULL DEFAULT NULL,
  customer_address VARCHAR(64) NULL DEFAULT NULL,
  customer_city VARCHAR(50) NULL DEFAULT NULL,
  customer_country VARCHAR(50) NULL DEFAULT NULL,
  customer_occupation VARCHAR(45) NULL DEFAULT NULL,
  customer_gender VARCHAR(10) NULL DEFAULT NULL,

  PRIMARY KEY (customer_key),
  INDEX customer_id (customer_id) VISIBLE
);

-- Dimension Tiempo
-- Tabla dim_date
CREATE TABLE IF NOT EXISTS dim_date (
  date_key INT(8) NOT NULL,              
  date_value DATE NOT NULL,              

  day_of_week VARCHAR(20) NOT NULL,
  month_number TINYINT(3) NOT NULL,
  month_name CHAR(12) NOT NULL,
  year4 SMALLINT(5) NOT NULL,
  year_month_number CHAR(7) NOT NULL,
  
  PRIMARY KEY (date_key),
  UNIQUE INDEX date (date_value) VISIBLE,
  UNIQUE INDEX date_value (`date_value` ASC) VISIBLE
);

-- Dimensión Producto 
-- Tabla dim_product
CREATE TABLE IF NOT EXISTS dim_product (

  product_key INT(8) NOT NULL AUTO_INCREMENT,
  product_id INT(8) NULL DEFAULT NULL,

  product_name VARCHAR(45) NULL DEFAULT NULL,
  product_description VARCHAR(60) NULL DEFAULT NULL,
  product_subcategory VARCHAR(64) NULL DEFAULT NULL,
  product_category VARCHAR(50) NULL DEFAULT NULL,


  PRIMARY KEY (product_key),
  INDEX product_id (product_id) VISIBLE
);

-- Dimensión Tienda
-- Tabla dim_store
CREATE TABLE IF NOT EXISTS dim_store (

  store_key INT(8) NOT NULL AUTO_INCREMENT,
  store_id INT(8) NULL DEFAULT NULL,

  store_name VARCHAR(45) NULL DEFAULT NULL,
  store_city VARCHAR(50) NULL DEFAULT NULL,
  store_country VARCHAR(50) NULL DEFAULT NULL,

  PRIMARY KEY (store_key),
  INDEX store_id (store_id) VISIBLE
);

-- Dimensión Vendedor
-- Tabla dim_seller
CREATE TABLE IF NOT EXISTS dim_seller (

  seller_key INT(8) NOT NULL AUTO_INCREMENT,
  seller_id INT(8) NULL DEFAULT NULL,

  seller_first_name VARCHAR(45) NULL DEFAULT NULL,
  seller_last_name VARCHAR(45) NULL DEFAULT NULL,
  seller_address VARCHAR(64) NULL DEFAULT NULL,
  seller_city VARCHAR(50) NULL DEFAULT NULL,
  seller_country VARCHAR(50) NULL DEFAULT NULL,
  seller_gender VARCHAR(10) NULL DEFAULT NULL,

  PRIMARY KEY (seller_key),
  INDEX seller_id (seller_id) VISIBLE
);

-- Hechos Ventas
-- Tabla fact_sales
CREATE TABLE IF NOT EXISTS fact_sales (
  customer_key INT(8) NOT NULL,
  date_key INT(8) NOT NULL,
  product_key INT(8) NOT NULL,
  store_key INT(8) NOT NULL,
  seller_key INT(8) NOT NULL,
  quantity INT(11) NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  INDEX fk_customer_idx (customer_key ASC) VISIBLE,
  INDEX fk_date_idx (date_key ASC) VISIBLE,
  INDEX fk_product_idx (product_key ASC) VISIBLE,
  INDEX fk_store_idx (store_key ASC) VISIBLE,
  INDEX fk_seller_idx (seller_key ASC) VISIBLE,

  CONSTRAINT fk_customer
    FOREIGN KEY (customer_key)
    REFERENCES dim_customer (customer_key)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    
  CONSTRAINT fk_store
    FOREIGN KEY (store_key)
    REFERENCES dim_store (store_key)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,

  CONSTRAINT fk_product
    FOREIGN KEY (product_key)
    REFERENCES dim_product (product_key)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,

  CONSTRAINT fk_date
    FOREIGN KEY (date_key)
    REFERENCES dim_date (date_key)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
