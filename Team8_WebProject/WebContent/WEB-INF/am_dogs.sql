create table am_dogs(
num number primary key,
id varchar2(35) references am_member(id), 
dname varchar2(40),
dage number, 
breed varchar2(50), 
weight varchar2(10), 
neutral varchar2(5),
gender varchar2(7), 
memo clob);


create sequence am_dogs_seq;