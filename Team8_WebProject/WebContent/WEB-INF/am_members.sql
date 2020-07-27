create table am_member(
id varchar2(35) primary key, 
pwd varchar2(20) not null, 
email varchar2(40), 
profile varchar2(100), 
name varchar2(15), 
phone varchar2(15) not null, 
regdate date);