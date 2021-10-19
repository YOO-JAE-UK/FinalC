drop table MEMBER CASCADE CONSTRAINTS;

  USER_DROP          number(1)   check(USER_DROP=0 or UESR_DROP=1) --회원탈퇴여부

create table MEMBER(
	USER_ID			   varchar2(50)  primary key,  --아이디
	USER_PASS	       varchar2(20)  ,  --패스워드 
	USER_NAME		   varchar2(20)  ,  --이름
	USER_NICKNAME	   varchar2(20)   unique,  --닉네임
	USER_EMAIL		   varchar2(30)   unique,  --이메일
	USER_ADDRESS_POST  varchar2(5)   ,  --우편번호
	USER_ADDRESS       varchar2(100) ,  --우편주소
	USER_PHONE         varchar2(20)  ,  --핸드폰
	USER_FILE          varchar2(100) ,
	USER_IMG           varchar2(100) ,  --유저이미지
	USER_CHECK         char(1) check(USER_CHECK='0' or USER_CHECK='1'),   --당일체크
	USER_LASTLOGIN     DATE default sysdate     --최근로그인날짜
);

insert into member values('user04', 'user04123', '브렌트', '린다', 'user04@naver.com', '08206', '서울 구로구 신도림로11가길 3 (신도림동)', '070-8240-3211', 'ㄱ', '1', sysdate );

alert table member 	modify USER_PASS null;
	
	select * from member 
where USER_ID='user02'
and USER_PASS='user02123';

update member set USER_DROP=1 
where USER_ID='user02'

select *from MEMBER;

update member set USER_EMAIL = 'ghkffur6145@naver.com' where USER_EMAIL ='user02@naver.com';




update member set USER_ID='admin' where USER_ID='ID중복체크,admin';  

delete from MEMBER where USER_EMAIL ='2021234@naver.com';
delete from MEMBER where USER_ID ='user03';

alter table member add USER_FILE varchar2(100) default'-';

alter table member modify USER_IMG invisible;



--자식 레코드 찾기--
select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
from user_constraints
where CONSTRAINT_NAME ='SYS_C008010';
--EMAIL SYS_COO7985

