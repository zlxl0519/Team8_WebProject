--constraint 제약조건이름 foreign key references 참조할테이블 (참조할 칼럼) 
--on delete cascade는 부모테이블인 am_member 테이블의 행에 대한 delete를 허용한다. 
--부모 테이블의 행이 지워지면 자식 테이블의 행도 같이 지워진다. 는 뜻 

create table reserve(
num number primary key, -- 예약 고유의 pk (예약번호)
member_id varchar2(15) references am_member(id), -- 소유자 id
dog_num number references am_dogs(num),      -- 강아지 pk
service varchar2(50),
checkin date,
checkout date,
etc clob
);


create sequence reserve_seq;
