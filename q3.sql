

CREATE TABLE cust(

id CHAR(5),

pwd VARCHAR(10) NOT NULL,

name VARCHAR(10) NOT NULL

);

ALTER TABLE cust ADD PRIMARY KEY (id);

​

# ------------------------------------------

​

CREATE TABLE item(

id INT,

name VARCHAR(20),

price INT,

rate FLOAT,

regdate DATE

);

ALTER TABLE item ADD PRIMARY KEY (id);

ALTER TABLE item MODIFY id INT AUTO_INCREMENT;

ALTER TABLE item AUTO_INCREMENT = 1000;

ALTER TABLE item ALTER COLUMN rate SET DEFAULT 3.3;