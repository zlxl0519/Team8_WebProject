CREATE TABLE review (
num NUMBER,
writer VARCHAR2(35),
profile VARCHAR2(200),
title VARCHAR2(100),
content CLOB,
regdate DATE,
recomm NUMBER,
CONSTRAINT review_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE rev_seq;

