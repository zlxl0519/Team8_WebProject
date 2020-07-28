CREATE TABLE qna (
num NUMBER,
writer VARCHAR2(100),
title VARCHAR2(300),
content CLOB,
regdate DATE,
hit NUMBER,
bgroup NUMBER,
sorts NUMBER,
depth NUMBER
CONSTRAINT qna_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE qna_seq;

