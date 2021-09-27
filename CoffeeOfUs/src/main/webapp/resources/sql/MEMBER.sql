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
	USER_IMG           varchar2(100) NOT NULL,  --유저이미지
	USER_CHECK         char(1) check(USER_CHECK='0' or USER_CHECK='1'),   --당일체크
	USER_LASTLOGIN     DATE default sysdate     --최근로그인날짜
);


insert into member values('user01', '1234', '홍길동', '도적', 'user01@naver.com', '123', '서울', '010', 'ㄱ', '1', sysdate );

select *from MEMBER;
delete from MEMBER_COFFEE;