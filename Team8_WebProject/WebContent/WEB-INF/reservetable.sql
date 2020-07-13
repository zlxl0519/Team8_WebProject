create table reserve(num number primary key, 
service varchar2(30), 
checkin date not null, 
checkout date not null, 
etc CLOB);

create sequence reserve_seq;
