drop table member2 CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table member2(
	id			varchar2(12),
	password	varchar2(60),
	name		varchar2(15),
	age			Number(2),
	gender		varchar2(5),
	email		varchar2(30),
	PRIMARY KEY(id)
);
insert into member2 values('user7','1234','������',25,'��','tmxkzm1004@naver.com');
select *from member2;
delete from member2 where id = '1admin'