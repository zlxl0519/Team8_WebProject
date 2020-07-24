CREATE TABLE am_notice(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	viewCount NUMBER, --조회수
	regdate DATE
);

CREATE SEQUENCE am_notice_seq;


SELECT NUM, WRITER, TITLE,
	LEAD(num, 1, 0) OVER (ORDER BY num DESC) AS nextNum,--번호에 대해서 내림차순 정렬 했을 때 하나 앞선다. 다음글
	Lag(num, 1, 0) OVER (ORDER BY num DESC) AS prevNum,--번호에 대해서 내림차순 정렬 했을 때 하나 뒤에꺼. 이전글
	FROM BOARD_CAFE 
	ORDER BY NUM DESC;