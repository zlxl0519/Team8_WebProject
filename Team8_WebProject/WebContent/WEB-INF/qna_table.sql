CREATE TABLE qna (
num NUMBER PRIMARY KEY,
title VARCHAR2(300),
content CLOB,
regdate DATE,
hit NUMBER,
id VARCHAR2(35) references am_member(id)
);

CREATE SEQUENCE qna_seq;

