create table am_dogs(
id varchar2(35) references am_member(id) primary key, 
dname varchar2(40),
dage number, 
breed varchar2(50), 
weight varchar2(10), 
neutral varchar2(5),
gender varchar2(7), 
memo clob);

