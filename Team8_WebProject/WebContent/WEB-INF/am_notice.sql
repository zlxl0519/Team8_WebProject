CREATE TABLE am_notice(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	viewCount NUMBER, --조회수
	regdate DATE
);

CREATE SEQUENCE am_notice_seq;
