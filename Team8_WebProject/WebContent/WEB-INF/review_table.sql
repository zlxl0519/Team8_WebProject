CREATE TABLE review (
num NUMBER PRIMARY KEY,
id VARCHAR2(35) references am_member(id)
title VARCHAR2(100),
content CLOB,
regdate DATE,
rating NUMBER NOT NULL DEFAULT 0
);

CREATE SEQUENCE rev_seq;

