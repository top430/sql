DROP TABLE IF EXISTS  customers ;

CREATE TABLE  customers  (
	 customer_id 	INT	NOT NULL,
	 customer_pw 	VARCHAR(45)	NULL,
	 customer_name 	VARCHAR(45)	NULL,
	 customer_email 	VARCHAR(45)	NULL,
	 customer_address 	VARCHAR(45)	NULL,
	 customer_phonenum 	VARCHAR(45)	NULL
);

DROP TABLE IF EXISTS  item_order ;

CREATE TABLE  item_order  (
	 order_id 	INT	NOT NULL,
	 customer_id 	INT	NOT NULL,
	 order_date 	DATE	NULL
);

DROP TABLE IF EXISTS  product ;

CREATE TABLE  product  (
	 product_id 	INT	NOT NULL,
	 product_name 	VARCHAR(45)	NOT NULL,
	 product_price 	INT	NULL,
	 product_dealer 	VARCHAR(45)	NULL
);

DROP TABLE IF EXISTS  product_review ;

CREATE TABLE  product_review  (
	 review_id 	INT	NOT NULL,
	 product_id 	INT	NOT NULL,
	 order_id 	INT	NOT NULL,
	 product_rating 	INT	NULL,
	 product_content 	VARCHAR(1000)	NULL
);

DROP TABLE IF EXISTS  cart_list ;

CREATE TABLE  cart_list  (
	 cart_id 	INT	NOT NULL,
	 customer_id 	INT	NOT NULL,
	 product_id 	INT	NOT NULL,
	 cart_qt 	INT	NULL
);

DROP TABLE IF EXISTS  order_detail ;

CREATE TABLE  order_detail  (
	 order_id 	INT	NOT NULL,
	 product_id 	INT	NOT NULL,
	 order_qt 	INT	NULL,
	 order_status 	VARCHAR(100)	NULL
);

DROP TABLE IF EXISTS  stock ;

CREATE TABLE  stock  (
	 product_id 	INT	NOT NULL,
	 stock_qt 	INT	NULL,
	 stock_supply 	VARCHAR(45)	NULL
);


# 1. customers
ALTER TABLE  customers  ADD CONSTRAINT  PK_CUSTOMERS  PRIMARY KEY ( customer_id );

ALTER TABLE customers MODIFY customer_id INT AUTO_INCREMENT;
ALTER TABLE customers AUTO_INCREMENT = 10;
#-----------------------------------------------------------------------------------------
INSERT INTO customers( customer_pw, customer_name, customer_email, customer_address, customer_phonenum)
VALUES ( 'pwd01', '이말숙', '11111@gmail.com', 'dd1', '01012345678');
INSERT INTO customers( customer_pw, customer_name, customer_email, customer_address, customer_phonenum)
VALUES ('pwd02', '가말숙', '11112@gmail.com', 'dd2', '01023444444');
INSERT INTO customers( customer_pw, customer_name, customer_email, customer_address, customer_phonenum)
VALUES ('pwd03', '나말숙', '11113@gmail.com', 'dd3', '01055555555');






# 2. item_order
ALTER TABLE  item_order  ADD CONSTRAINT  PK_ITEM_ORDER  PRIMARY KEY ( order_id );
ALTER TABLE  item_order  ADD CONSTRAINT FOREIGN KEY (customer_id)
REFERENCES customers (customer_id);
ALTER TABLE item_order MODIFY order_id INT AUTO_INCREMENT;
ALTER TABLE item_order AUTO_INCREMENT = 100;
#-----------------------------------------------------------------------------------------
INSERT INTO item_order(customer_id, order_date)
VALUES (10, CURDATE());
INSERT INTO item_order(customer_id, order_date)
VALUES (11, CURDATE());
INSERT INTO item_order(customer_id, order_date)
VALUES (12, CURDATE());
INSERT INTO item_order(customer_id, order_date)
VALUES (10, CURDATE());



# 3. product
ALTER TABLE  product  ADD CONSTRAINT  PK_PRODUCT  PRIMARY KEY ( product_id );

ALTER TABLE product MODIFY product_id INT AUTO_INCREMENT;
ALTER TABLE product AUTO_INCREMENT = 1000;
#-----------------------------------------------------------------------------------------
INSERT INTO product(product_name, product_price, product_dealer)
VALUES ('kia_sportage','40000000', 'songpadaeri-jum');
INSERT INTO product(product_name, product_price, product_dealer)
VALUES ('hyundai_avante','20000000', 'sungbukdaeri-jum');
INSERT INTO product(product_name, product_price, product_dealer)
VALUES ('sony_ps5','5500000', 'emart_traders');

# 4. product_review
ALTER TABLE  product_review  ADD CONSTRAINT  PK_PRODUCT_REVIEW  PRIMARY KEY ( review_id );
ALTER TABLE  product_review  ADD CONSTRAINT FOREIGN KEY (product_id)
REFERENCES  product  (product_id);
ALTER TABLE  product_review  ADD CONSTRAINT FOREIGN KEY (order_id)
REFERENCES  item_order  (order_id);
ALTER TABLE product_review MODIFY review_id INT AUTO_INCREMENT;
ALTER TABLE product_review AUTO_INCREMENT = 10000;

#-----------------------------------------------------------------------------------------
INSERT INTO product_review (product_id, order_id, product_rating, product_content)
VALUES (1000, 100, 5, '정말 지구상에 존재하는 최고의 차');
INSERT INTO product_review (product_id, order_id, product_rating, product_content)
VALUES (1001, 102, 5, '작지만 강한 차!');
INSERT INTO product_review (product_id, order_id, product_rating, product_content)
VALUES (1002, 101, 5, '현존 최고의 콘솔');


# 5. cart_list
ALTER TABLE  cart_list  ADD CONSTRAINT  PK_CART_LIST  PRIMARY KEY ( cart_id );
ALTER TABLE  cart_list  ADD CONSTRAINT FOREIGN KEY (product_id)
REFERENCES  product  (product_id);

ALTER TABLE  cart_list  ADD CONSTRAINT FOREIGN KEY (customer_id)
REFERENCES  customers  (customer_id);
ALTER TABLE cart_list MODIFY cart_id INT AUTO_INCREMENT;
ALTER TABLE cart_list AUTO_INCREMENT = 100000;

#-----------------------------------------------------------------------------------------
INSERT INTO cart_list (customer_id, product_id, cart_qt)
VALUES (10, 1000, 5);
INSERT INTO cart_list (customer_id, product_id, cart_qt)
VALUES (10, 1001, 5);
INSERT INTO cart_list (customer_id, product_id, cart_qt)
VALUES (11, 1002, 25);
INSERT INTO cart_list (customer_id, product_id, cart_qt)
VALUES (12, 1002, 1);


# 6. order_detail
ALTER TABLE  order_detail  ADD CONSTRAINT  PK_ORDER_DETAIL  PRIMARY KEY ( order_id );
ALTER TABLE  order_detail  ADD CONSTRAINT  FK_item_order_TO_order_detail_1  FOREIGN KEY ( order_id )
REFERENCES  item_order  ( order_id );

ALTER TABLE  order_detail  ADD CONSTRAINT FOREIGN KEY (product_id)
REFERENCES  product  (product_id);
#-----------------------------------------------------------------------------------------
INSERT INTO order_detail (order_id, product_id, order_qt, order_status)
VALUES (100, 1000, 5, '배송중');
INSERT INTO order_detail (order_id, product_id, order_qt, order_status)
VALUES (101, 1001, 5, '결제확인');
INSERT INTO order_detail (order_id, product_id, order_qt, order_status)
VALUES (102, 1002, 5, '배송지연');
INSERT INTO order_detail (order_id, product_id, order_qt, order_status)
VALUES (103, 1002, 1, '배송지연');



# 7. stock
ALTER TABLE  stock  ADD CONSTRAINT  PK_stock  PRIMARY KEY ( product_id );
ALTER TABLE  stock  ADD CONSTRAINT  FK_product_TO_stock_1  FOREIGN KEY ( product_id )
REFERENCES  product  (product_id );
ALTER TABLE  stock  ADD CONSTRAINT FOREIGN KEY (product_id)
REFERENCES  product  (product_id);
#-----------------------------------------------------------------------------------------
INSERT INTO stock (product_id, stock_qt, stock_supply)
VALUES (1000, 100, '기아광주공장');
INSERT INTO stock (product_id, stock_qt, stock_supply)
VALUES (1001, 90, '현대대구공장');
INSERT INTO stock (product_id, stock_qt, stock_supply)
VALUES (1002, 0, '소니상하이공장');



