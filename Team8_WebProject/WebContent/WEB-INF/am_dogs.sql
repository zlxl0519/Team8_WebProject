create table am_dogs(
num number primary key, -- 강아지 고유의 pk
member_id varchar2(35) references am_member(id), -- 강아지 소유자 의 id
dname varchar2(40), -- 강아지 이름
dage number,  -- 강아지 나이
breed varchar2(50),   -- 강아지 종류            
weight varchar2(10),  -- 몸무게
neutral varchar2(5) , -- 중성화 여부
gender varchar2(7) ,  -- 성별
memo clob); -- 기타등등

create sequence am_dogs_seq;


create table am_member(
id varchar2(35) primary key, not null,
pwd varchar2(20),
email varchar2(40),
profile varchar2(100),
name varchar2(15),
phone varchar2(15),
regdate date
);

create sequence am_member_seq;