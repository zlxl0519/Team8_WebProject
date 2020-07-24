CREATE TABLE review (
num NUMBER PRIMARY KEY,
writer VARCHAR2(35),
profile VARCHAR2(200),
title VARCHAR2(100),
content CLOB,
regdate DATE,
recomm NUMBER
);

CREATE SEQUENCE rev_seq;

