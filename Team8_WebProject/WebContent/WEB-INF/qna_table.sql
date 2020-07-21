CREATE TABLE qna (
num NUMBER PRIMARY KEY,
writer VARCHAR2(100),
title VARCHAR2(300),
content CLOB,
regdate DATE,
hit NUMBER,
image VARCHAR2(200)
);

CREATE SEQUENCE qna_seq;

