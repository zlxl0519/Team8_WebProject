create table reserve(
num number, -- 예약 고유의 pk (예약번호)
member_id varchar2(35), -- 소유자 id
dog_num number,      -- 강아지 pk
service varchar2(50),
checkin date,
checkout date,
etc clob,
constraint reserve_num_pk primary key(num),
constraint reserve_member_id_fk foreign key(member_id) references am_member(id) on delete cascade,
constraint reserve_dog_num_fk foreign key(dog_num) references am_dogs(num) on delete cascade
);


create sequence reserve_seq;
