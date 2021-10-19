drop table PSY_T CASCADE CONSTRAINTS;/
--테스트 테이블
create table PSY_T(
   PSY_T_NUM	       	NUMBER       NOT NULL,   --글번호
   PSY_T_NAME			VARCHAR2(500) UNIQUE NOT NULL, --커피이름 실질적인 프라이머리키
   PSY_T_1KEYWORD		VARCHAR2(500) NOT NULL,
   PSY_T_2KEYWORD		VARCHAR2(500) NOT NULL,
   PSY_T_3KEYWORD		VARCHAR2(500) NOT NULL,
    PRIMARY KEY(PSY_T_NUM)
);

select * from PSY_T;

delete from PSY_T

insert into PSY_T values(1,'에스프레소(여왕)','chocolate','red_apple', '1');
insert into PSY_T values(2,'에스프레소(시그니처)','chocolate','red_apple', '2');
insert into PSY_T values(3,'에스프레소(연인)','chocolate','red_apple', '3');
insert into PSY_T values(4,'콜롬비아 수프리모','chocolate','green_apple', '1');
insert into PSY_T values(5,'인도네시아 만델링G1','chocolate','green_apple', '2');
insert into PSY_T values(6,'코스타리카 따라주','chocolate','green_apple', '3');

insert into PSY_T values(7,'브라질 세하도 NY2','biscuit','red_apple', '1');
insert into PSY_T values(8,'하우스 블랜드','biscuit','red_apple', '2');
insert into PSY_T values(9,'에스프레소(별다방)','biscuit','red_apple', '3');
insert into PSY_T values(10,'예멘 모카 마타리','biscuit','green_apple', '1');
insert into PSY_T values(11,'에스프레소(신사)','biscuit','green_apple', '2');
insert into PSY_T values(12,'에스프레소(이태리)','biscuit','green_apple', '3');

insert into PSY_T values(13,'에스프레소 (아우라)','lemon','red_apple', '1');
insert into PSY_T values(14,'온두라스','lemon','red_apple', '2');
insert into PSY_T values(15,'과테말라 안티구아','lemon','red_apple', '3');	
insert into PSY_T values(16,'에디오피아 모카 시다모','lemon','green_apple', '1');
insert into PSY_T values(17,'탄지니아 AAA','lemon','green_apple', '2');
insert into PSY_T values(18,'케냐 AA','lemon','green_apple', '3');
--일산 커피공장 참조
create table TASTE(
   TASTE_NUM	       	NUMBER       NOT NULL,   --글번호
   TASTE				VARCHAR2(500) NOT NULL, --커피이름 실질적인 프라이머리키
    PRIMARY KEY(TASTE_NUM)
);
select * from TASTE;

drop table TASTE CASCADE CONSTRAINTS;
insert into TASTE values(1,'chocolate');
insert into TASTE values(2,'green');
insert into TASTE values(3,'roasting_row');
insert into TASTE values(4,'lemon');



-------------------------------------------------------------
--find_word 테이블

create table FWORD(
   FWORD_NUM	       	NUMBER       NOT NULL,   --글번호
   FWORD_CONSONANT 		VARCHAR2(4) NOT NULL,  --자음
   FWORD_WORD			VARCHAR2(50) NOT NULL UNIQUE, --단어
   FWORD_CONTENT		VARCHAR2(2000) NOT NULL,
    PRIMARY KEY(FWORD_NUM)
);
select *from FWORD
--기본 INSERT 해서 넣기 //나머지는 write 해서 넣기
INSERT INTO FWORD VALUES(1,'ㄹ','로스팅','커피 생두에 열을 가해 조직을 팽창시키고 화학 변화를 일으켜 맛과 향을 끌어내는 작업')
INSERT INTO FWORD VALUES(2,'ㄱ','과다추출','에스프레소 추출시 시간이 지체되어 커피성분이 과다하게 다오는 현상');
INSERT INTO FWORD VALUES(3,'ㄴ','뉴 크롭','그 해에 수획된 생두');
INSERT INTO FWORD VALUES(4,'ㄷ','더치커피','실온에서 물을 한방울씩 떨어지게 하여 찬물로 커피를 추출하는 방식');
INSERT INTO FWORD VALUES(5,'ㄱ','결점두','품질이 떨어지는 커피콩을 말한다.');
-- 6,'ㄴ','녹병','커피 나뭇잎에 생기는 병으로, 빨리 전염되는 특성이 있다.'

-----------------------------
--원두 테이블
create table BEAN(
	BEAN_NUM	 	      	NUMBER      			NOT NULL, -- 고유넘버
	BEAN_NAME 				VARCHAR2(200) UNIQUE	NOT NULL,  -- 커피(원두)이름
	BEAN_CONTENT			VARCHAR2(2000) 			NOT NULL , -- 커피설명
	BEAN_FILE				VARCHAR2(100) 	,		--첨부 파일 명(가공)
	BEAN_ORIGINAL			VARCHAR2(100)	,		--첨부 파일 명(진짜)
	BEAN_DATE				DATE	NOT NULL, --등록날짜
	BEAN_ROASTING			NUMBER 	NOT NULL,		--커피 강도(로스팅)
	BEAN_AROMA				NUMBER 	NOT NULL,		--커피 향
	BEAN_SOUR				NUMBER 	NOT NULL,		--커피 신맛
	BEAN_SWEET				NUMBER 	NOT NULL,		--커피 단맛
	BEAN_BALANCE			NUMBER 	NOT NULL,		--커피 밸런스
	BEAN_BODY				NUMBER 	NOT NULL,		--커피바디감
    PRIMARY KEY(BEAN_NUM)
);
SELECT *FROM BEAN

DELETE FROM BEAN


