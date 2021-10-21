sys as sysdba --�엯�젰�썑 鍮꾨�踰덊샇�엯�젰

CREATE USER final IDENTIFIED BY 1234;
GRANT CONNECT, DBA, RESOURCE TO final;
GRANT DROP ANY TABLE TO final;


drop table COFFEE CASCADE CONSTRAINTS;
CREATE TABLE COFFEE(
	COFFEE_NUM			NUMBER NOT NULL,					--湲�踰덊샇
	COFFEE_PASS			VARCHAR2(30) NOT NULL,				--鍮꾨�踰덊샇
	COFFEE_SUBJECT		VARCHAR2(300) NOT NULL,				--�젣紐�
	USER_ID				VARCHAR2(20) NOT NULL references member(USER_ID),--�븘�씠�뵒
	USER_NICKNAME		VARCHAR2(20) NOT NULL,				--�땳�꽕�엫
	COFFEE_CONTENT		VARCHAR2(4000) NOT NULL,			--�궡�슜
	COFFEE_FILE			VARCHAR2(100),						--泥⑤� �뙆�씪 紐�(媛�怨�)30
	COFFEE_ORIGINAL		VARCHAR2(100),						--泥⑤� �뙆�씪 紐�30
	COFFEE_DATE			DATE NOT NULL,				--湲��쓽 �옉�꽦 �궇吏�
	COFFEE_READCOUNT	NUMBER NOT NULL,					--湲��쓽 議고쉶�닔
	COFFEE_RE_REF		NUMBER,								--�떟蹂� 湲� �옉�꽦�떆 李몄“�릺�뒗 湲��쓽 踰덊샇
	COFFEE_RE_LEV		NUMBER CHECK(COFFEE_RE_LEV IN(0,1)),--�떟蹂� 湲��쓽 源딆씠
	COFFEE_RE_SEQ		NUMBER,								--�떟蹂� 湲��쓽 �닚�꽌
	PRIMARY KEY(COFFEE_NUM)	
)

insert into COFFEE values(1,'1234','泥ル쾲吏� 寃뚯떆湲��젣紐�','admin','愿�由ъ옄','�궡�슜�엯�땲�떎.',NULL,NULL,SYSDATE,0,0,0,0);
SELECT *FROM COFFEE;
delete from COFFEE;