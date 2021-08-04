ALTER TABLE customers MODIFY customer_code INT AUTO_INCREMENT;
ALTER TABLE customers AUTO_INCREMENT = 1000;

INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id01', 'pwd01', '이말숙', '11111@gmail.com');
INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id02', 'pwd02', '가말숙', '11112@gmail.com');
INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id03', 'pwd03', '나말숙', '11113@gmail.com');
INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id04', 'pwd04', '다말숙', '11114@gmail.com');
INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id05', 'pwd05', '라말숙', '11115@gmail.com');
INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id06', 'pwd06', '마말숙', '11116@gmail.com');
INSERT INTO customers(customer_id, customer_pw, customer_name, customer_email)
VALUES ('id07', 'pwd07', '바말숙', '11117@gmail.com');



ALTER TABLE product MODIFY product_id INT AUTO_INCREMENT;
ALTER TABLE product AUTO_INCREMENT = 10000;

INSERT INTO product(product_name, product_price)
VALUES ('1','200000');
INSERT INTO product(product_name, product_price)
VALUES ('1','200088');
INSERT INTO product(product_name, product_price)
VALUES ('4','250000');
INSERT INTO product(product_name, product_price)
VALUES ('15','2400000');

ALTER TABLE ORDER1 MODIFY ORDER_id INT AUTO_INCREMENT;
ALTER TABLE ORDER1 AUTO_INCREMENT = 10000;

INSERT INTO ORDER1(customer_code, product_id, order_date, order_qt)
VALUES (1001, 100001, CURDATE(), '1');
INSERT INTO ORDER1(customer_code, product_id, order_date, order_qt)
VALUES (1001, 100001, CURDATE(), '3');
INSERT INTO ORDER1(customer_code, product_id, order_date, order_qt)
VALUES (1001, 100001, CURDATE(), '2');
INSERT INTO ORDER1(customer_code, product_id, order_date, order_qt)
VALUES (1001, 100001, CURDATE(), '4');
