create table reserve(
num number, 
id varchar2(35) references am_member(id),
service varchar2(30), 
checkin date not null, 
checkout date not null, 
etc CLOB);

create sequence reserve_seq;
