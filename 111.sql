empDROP TABLE emp;
DROP TABLE dept;

CREATE TABLE dept(
	dptno CHAR(2) PRIMARY KEY,
	deptname VARCHAR(20),
	deptloc VARCHAR(20)
);

CREATE TABLE emp(
	empno CHAR(4) PRIMARY KEY,
	deptno CHAR(2),
	empname VARCHAR(10),
	manager CHAR(4),
	salary INT(5),
	hdate DATE
);

INSERT INTO emp VALUES ('1001, '10', '킹', NULL, 5000, '1997-01-01');