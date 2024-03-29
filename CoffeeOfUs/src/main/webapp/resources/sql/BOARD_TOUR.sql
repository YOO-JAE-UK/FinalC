drop table BOARD_TOUR CASCADE CONSTRAINTS;
CREATE TABLE BOARD_TOUR(
	TOUR_NUM			NUMBER 			NOT NULL,			--글번호
	USER_ID				VARCHAR2(20) 	NOT NULL references member(USER_ID),,			--아이디
	USER_NICKNAME		VARCHAR2(20)	NOT NULL,			--닉네임
	TOUR_ADDRESS		VARCHAR2(200)	NOT NULL,			--주소
	TOUR_NAME			VARCHAR2(100) 	NOT NULL,			--카페 이름
	TOUR_SUBJECT		VARCHAR2(100) 	NOT NULL,			--글 제목
	TOUR_CONTENT		VARCHAR2(4000) 	NOT NULL,			--내용
	TOUR_LATNG			VARCHAR2(100) 	NOT NULL,			--(위도,경도)
	TOUR_FILE			VARCHAR2(100) 	,					--첨부 파일 명(가공)
	TOUR_ORIGINAL		VARCHAR2(100)	,					--첨부 파일 명
	TOUR_DATE			DATE 			NOT NULL,			--작성날짜
	TOUR_GRADE			NUMBER			NOT NULL,			--전체 평점
	TOUR_TASTE			NUMBER			NOT NULL,			--평점(맛)
	TOUR_ATMOSPHERE		NUMBER			NOT NULL,			--평점(분위기)
	TOUR_SERVICE		NUMBER			NOT NULL,			--평점(서비스)
	TOUR_READCOUNT		NUMBER			NOT NULL,			--조회수
	TOUR_ADMIN			NUMBER 	CHECK(TOUR_ADMIN IN(0,1))	NOT NULL, -- 관리자리스트(MAP페이지에서 뜨는list)
	PRIMARY KEY(TOUR_NUM)	
);



--insert into BOARD_TOUR values()
--insert into BOARD_TOUR values(1,'1234','첫번째 게시글제목','admin','관리자','내용입니다.',NULL,NULL,SYSDATE,0,0,0,0);
SELECT *FROM BOARD_TOUR;
delete from BOARD_TOUR;

select * from BOARD_TOUR 

update BOARD_TOUR
SET TOUR_ADMIN =1
WHERE TOUR_NUM =7

SELECT * FROM BOARD_TOUR
				WHERE TOUR_ADMIN = 
						(SELECT MAX(TOUR_ADMIN) 
							FROM BOARD_TOUR
								WHERE TOUR_NAME = 'cafe' AND TOUR_ADDRESS LIKE '%경기도%') --cafe라는 이름으로된 0,1을 찾아라 
									AND TOUR_NUM= 
						(SELECT MIN(TOUR_NUM)
			 			FROM BOARD_TOUR
							WHERE TOUR_ADMIN = 
										(SELECT MAX(TOUR_ADMIN) 			--cafe라는 이름으로된 0,1을 찾아라
											FROM BOARD_TOUR
												WHERE TOUR_NAME = 'cafe' AND TOUR_ADDRESS LIKE '%경기도%'
										)
													AND  TOUR_NAME = 'cafe' 
						)
					
				--
				SELECT *FROM BOARD_TOUR
	 		WHERE TOUR_ADMIN = 0
	 			AND TOUR_NAME LIKE 'cafe'
	 			AND TOUR_ADDRESS LIKE '%경기도%'
	 			--
	 			delete from BOARD_TOUR where TOUR_NUM=8;
	 			--

	 			--

