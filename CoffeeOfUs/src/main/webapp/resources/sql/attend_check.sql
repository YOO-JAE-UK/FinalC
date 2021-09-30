drop table attend_check CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table attend_check(
	id			varchar2(20) references member(user_id),
	attenddate	 varchar2(20)
	
);
insert into member values('a','1234','강문','rkdans25','jw890825@gmail.com','11111','안양시','010-1111-1111','i.png','1',sysdate)
insert into attend_check values ('a','2021-08-10')
delete from ATTEND_CHECK where id='a'
select * from attend_check
select * from member