#alter table [추가할테이블명] add constraint [제약조건명] foreign KEY(컬럼명) 
#references [부모테이블명] (PK컬럼명) [ON DELETE CASCADE / ON UPDATE CASECADE];

#alter table [테이블명] drop foreign key [제약조건명];

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
	 product_review 	VARCHAR(1000)	NULL
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

#ALTER TABLE customers ADD PRIMARY KEY (customer_code);

ALTER TABLE  customers  ADD CONSTRAINT  PK_CUSTOMERS  PRIMARY KEY (
	 customer_id 
);

ALTER TABLE  item_order  ADD CONSTRAINT  PK_ITEM_ORDER  PRIMARY KEY (
	 order_id 
);

ALTER TABLE  product  ADD CONSTRAINT  PK_PRODUCT  PRIMARY KEY (
	 product_id 
);

ALTER TABLE  product_review  ADD CONSTRAINT  PK_PRODUCT_REVIEW  PRIMARY KEY (
	 review_id 
);

ALTER TABLE  cart_list  ADD CONSTRAINT  PK_CART_LIST  PRIMARY KEY (
	 cart_id 
);

ALTER TABLE  order_detail  ADD CONSTRAINT  PK_ORDER_DETAIL  PRIMARY KEY (
	 order_id 
);

ALTER TABLE  stock  ADD CONSTRAINT  PK_stock  PRIMARY KEY (
	 product_id 
);

ALTER TABLE  order_detail  ADD CONSTRAINT  FK_item_order_TO_order_detail_1  FOREIGN KEY (
	 order_id 
)
REFERENCES  item_order  (
	 order_id 
);

ALTER TABLE  order_detail  ADD CONSTRAINT FOREIGN KEY (
	product_id
)
REFERENCES  product  (
	product_id
);

ALTER TABLE  stock  ADD CONSTRAINT  FK_product_TO_stock_1  FOREIGN KEY (
	 product_id 
)
REFERENCES  product  (
	 product_id 
);

ALTER TABLE  cart_list  ADD CONSTRAINT FOREIGN KEY (
	product_id
)
REFERENCES  product  (
	product_id
);

ALTER TABLE  cart_list  ADD CONSTRAINT FOREIGN KEY (
	customer_id
)
REFERENCES  customers  (
	customer_id
);

ALTER TABLE  product_review  ADD CONSTRAINT FOREIGN KEY (
	product_id
)
REFERENCES  product  (
	product_id
);

ALTER TABLE  product_review  ADD CONSTRAINT FOREIGN KEY (
	order_id
)
REFERENCES  item_order  (
	order_id
);

ALTER TABLE  product_review  ADD CONSTRAINT FOREIGN KEY (
	order_id
)
REFERENCES  item_order  (
	order_id
);

ALTER TABLE  item_order  ADD CONSTRAINT FOREIGN KEY (
	customer_id
)
REFERENCES  customers  (
	customer_id
);

ALTER TABLE  stock  ADD CONSTRAINT FOREIGN KEY (
	product_id
)
REFERENCES  product  (
	product_id
);