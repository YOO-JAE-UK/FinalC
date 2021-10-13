drop table PSY_T CASCADE CONSTRAINTS;/

create table PSY_T(
   PSY_T_NUM	       	NUMBER       NOT NULL,   --글번호
   PSY_T_NAME			VARCHAR2(500) NOT NULL, --커피이름 실질적인 프라이머리키
   PSY_T_1KEYWORD		VARCHAR2(500) NOT NULL,
   PSY_T_2KEYWORD		VARCHAR2(500) NOT NULL,
   PSY_T_3KEYWORD		VARCHAR2(500) NOT NULL,
    PRIMARY KEY(PSY_T_NUM)
);

select * from PSY_T;
insert into PSY_T values(1,'케냐AA','chocolate','green', 'roasting_row');
insert into PSY_T values(2,'블루마운틴','lemon','green', 'roasting_row');
insert into PSY_T values(3,'여왕','chocolate','yellow', 'roasting_row');

create table TASTE(
   TASTE_NUM	       	NUMBER       NOT NULL,   --글번호
   TASTE				VARCHAR2(500) NOT NULL, --커피이름 실질적인 프라이머리키
    PRIMARY KEY(TASTE_NUM)
);
select * from TASTE;

insert into TASTE values(1,'chocolate');
insert into TASTE values(2,'green');
insert into TASTE values(3,'roasting_row');
insert into TASTE values(4,'lemon');

SELECT * 
FROM PSY_T A
INNER JOIN (SELECT * FROM TASTE WHERE TASTE='chocolate' OR TASTE='green' OR TASTE='roasting_row') B
ON A.PSY_T_1KEYWORD = B.TASTE and A.PSY_T_2KEYWORD = B.TASTE

SELECT *
FROM PSY_T
WHERE PSY_T_1KEYWORD='chocolate' and PSY_T_2KEYWORD ='green' and PSY_T_3KEYWORD='roasting_row'


-------------------------------------------------------------
--find_word

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