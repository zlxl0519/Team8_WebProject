create table gallery(
num number primary key,
id varchar2(35) references am_member(id),
caption varchar2(100),
content clob,
imagePath varchar2(100) not null,
hit number,
regdate date
);

create sequence gallery_seq;