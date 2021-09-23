drop table member2 CASCADE CONSTRAINTS;
--1. index.jsp에서 시작 합니다.
--2. 관리자 계정 admin, 비번 1234를 만듭니다.
--3. 사용자 계정을 3개 만듭니다.

create table member2(
	id			varchar2(12),
	password	varchar2(60),
	name		varchar2(15),
	age			Number(2),
	gender		varchar2(5),
	email		varchar2(30),
	PRIMARY KEY(id)
);
insert into member2 values('user7','1234','관리자',25,'남','tmxkzm1004@naver.com');
select *from member2;
delete from member2 where id = '1admin'