drop table MEMBER CASCADE CONSTRAINTS;


create table MEMBER(
	USER_ID			   varchar2(20)  primary key,  --아이디
	USER_PASS	       varchar2(20)  NOT NULL,  --패스워드 
	USER_NAME		   varchar2(20)  NOT NULL,  --이름
	USER_NICKNAME	   varchar2(20)  NOT NULL unique,  --닉네임
	USER_EMAIL		   varchar2(30)  NOT NULL unique,  --이메일
	USER_ADDRESS_POST  varchar2(5)   NOT NULL,  --우편번호
	USER_ADDRESS       varchar2(100) NOT NULL,  --우편주소
	USER_PHONE         varchar2(20)  NOT NULL,  --핸드폰
	USER_FILE          varchar2(100) ,
	USER_IMG           varchar2(100) NOT NULL,  --유저이미지
	USER_CHECK         char(1) check(USER_CHECK='0' or USER_CHECK='1'),   --당일체크
	USER_LASTLOGIN     DATE default sysdate     --최근로그인날짜
);


  USER_DROP          number(1)   check(USER_DROP=0 or UESR_DROP=1) --회원탈퇴여부
	
	
	select * from member 
where USER_ID='user02'
and USER_PASS='user02123';

update member set USER_DROP=1 
where USER_ID='user02'

select *from MEMBER;

update member set USER_PASS = 'user01123' where USER_ID ='user01';



insert into member values('admin', 'admin123', '관리자', '관리자', 'coffee_project@naver.com', '03134', '서울 종로구 율곡로10길 105 (봉익동)', '070-8240-3211', 'ㄱ', '1', sysdate );

update member set USER_ID='admin' where USER_ID='ID중복체크,admin';  

delete from MEMBER where USER_ID ='admin';
delete from MEMBER where USER_ID ='user01';

alter table member add USER_FILE varchar2(100) default'-';

alter table member modify USER_IMG invisible;



--자식 레코드 찾기--
select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
from user_constraints
where CONSTRAINT_NAME ='SYS_C008010';
--EMAIL SYS_COO7985

