/*
  Efetue o download do dataset existente no link:
  https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

  - Após criar as tabelas abaixo, importe o dataset, preenchendo assim a base de dados;
*/

--DROP TABLE customers_RMxxxxx;
CREATE TABLE customers_RMxxxxx (
  customer_id              VARCHAR(32),
  customer_unique_id       VARCHAR(32),
  customer_zip_code_prefix VARCHAR(5),
  customer_city            VARCHAR(50),
  customer_state           VARCHAR(2),
  PRIMARY KEY(customer_id)
);

--DROP TABLE geolocations_RMxxxxx;
CREATE TABLE geolocations_RMxxxxx (
    geolocation_zip_code_prefix VARCHAR(5) ,
    geolocation_lat             NUMBER(38,20) ,
    geolocation_lng             NUMBER(38,20) ,
    geolocation_city            VARCHAR(50) ,
    geolocation_state           VARCHAR(2)--,
    --PRIMARY KEY (geolocation_zip_code_prefix, geolocation_city, geolocation_state)
);

--DROP TABLE order_itens_RMxxxxx;
CREATE TABLE order_itens_RMxxxxx(
   order_id            VARCHAR(32),
   order_item_id       INTEGER,
   product_id          VARCHAR(32),
   seller_id           VARCHAR(32),
   shipping_limit_date DATE,
   price               NUMBER(10,3),
   freight_value       NUMBER(10,3),
   PRIMARY KEY (order_id, order_item_id)
);

--DROP TABLE order_payments_RMxxxxx;
CREATE TABLE order_payments_RMxxxxx (
  order_id varchar(32),
  payment_sequencial integer,
  payment_type varchar(30),
  payment_installments integer,
  payment_values NUMBER(38,3),
  PRIMARY  KEY (order_id, payment_sequencial)
);

--DROP TABLE order_reviews_RMxxxxx;
CREATE TABLE order_reviews_RMxxxxx(
  review_id VARCHAR(128),
  order_id VARCHAR(128),
  review_score integer,
  review_comment_title varchar(500),
  review_comment_message varchar(1000),
  review_creation_date date,
  review_answer_timestamp date
);

--DROP TABLE orders_RMxxxxx;
CREATE TABLE orders_RMxxxxx(
  ORDER_ID VARCHAR(32),
  CUSTOMER_ID VARCHAR(32),
  ORDER_STATUS VARCHAR(30),
  ORDER_PURCHASE_TIMESTAMP TIMESTAMP,
  ORDER_APPROVED_AT TIMESTAMP,
  ORDER_DELIVERED_CARRIER_DATE VARCHAR(26),
  ORDER_DELIVERED_CUSTOMER_DATE VARCHAR(26),
  ORDER_ESTIMATED_DELIVERY_DATE DATE,
  PRIMARY KEY (ORDER_ID)
);

--DROP TABLE product_RMxxxxx;
CREATE TABLE product_RMxxxxx(
    product_id VARCHAR2(128),
    product_category_name VARCHAR2(128),
    product_name_lenght NUMBER(38,0),
    product_description_lenght NUMBER(38,0),
    product_photos_qty NUMBER(38,0),
    product_weight_g NUMBER(38,0),
    product_length_cm NUMBER(38,0),
    product_height_cm NUMBER(38,0),
    product_width_cm NUMBER(38,0),
    PRIMARY KEY (product_id)
);

--DROP TABLE PRODUCT_CATEGORIES_RMxxxxx;
CREATE TABLE PRODUCT_CATEGORIES_RMxxxxx(
  PRODUCT_CATEGORY_NAME	VARCHAR2(128),
  PRODUCT_CATEGORY_NAME_ENGLISH	VARCHAR2(128),
  PRIMARY KEY (PRODUCT_CATEGORY_NAME)
);

--DROP TABLE SELLERS;
CREATE TABLE SELLERS_RMxxxxx(
   SELLER_ID	            VARCHAR2(128),
   SELLER_ZIP_CODE_PREFIX	VARCHAR2(26), 
   SELLER_CITY	            VARCHAR2(50),
   SELLER_STATE	            VARCHAR2(26),
   PRIMARY KEY (SELLER_ID)
);
