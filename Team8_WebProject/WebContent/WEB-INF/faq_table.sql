CREATE TABLE faq (
num NUMBER, 
qst CLOB, 
ans CLOB,
CONSTRAINT faq_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE faq_seq;

