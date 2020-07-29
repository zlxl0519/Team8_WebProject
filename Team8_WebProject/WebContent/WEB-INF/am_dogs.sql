create table am_dogs(
num number, -- 강아지 고유의 pk
member_id varchar2(35), -- 강아지 소유자 의 id
dname varchar2(40), -- 강아지 이름
dage number,  -- 강아지 나이
breed varchar2(50),   -- 강아지 종류            
weight varchar2(10),  -- 몸무게
neutral varchar2(5) , -- 중성화 여부
gender varchar2(7) ,  -- 성별
memo clob,
constraint am_dogs_num_pk primary key(num),
constraint am_dogs_member_id_fk foreign key(member_id) references am_member(id) on delete cascade
); -- 기타등등

create sequence am_dogs_seq;
