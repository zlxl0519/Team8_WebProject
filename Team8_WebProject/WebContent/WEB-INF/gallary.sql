-- ======= 임시 table =============
CREATE TABLE gallary(
   num number primary key,
   title varchar2(100) not null,
   content clob,
   orgFileName varchar2(100) not null, -- 원본 파일명
   saveFileName varchar2(100) not null, -- 서버에 저장된 파일명
   fileSize number not null,
   regdate date
);

create sequence gallary_seq;