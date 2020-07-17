
create table reserve(
num number primary key, -- 예약 고유의 pk (예약번호)
member_id varchar2(35) references am_member(id), -- 소유자 id
dog_num number references am_dogs(num),      -- 강아지 pk
service varchar2(50),
checkin date,
checkout date,
etc clob
);


create sequence reserve_seq;
