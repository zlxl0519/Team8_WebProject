create table gallery(
num number ,
id varchar2(35) ,
caption varchar2(100) not null,
content clob,
imagePath varchar2(100) not null,
hit number,
regdate date,
constraint gallery_num_pk primary key(num),
constraint gallery_id_fk foreign key(id) references am_member(id)
);

create sequence gallery_seq;