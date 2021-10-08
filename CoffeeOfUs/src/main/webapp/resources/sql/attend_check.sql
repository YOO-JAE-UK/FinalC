drop table attend_check CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table attend_check(
	num			number primary key,
    id			varchar2(20) references member(user_id),
	attenddate	 date,
	status       varchar2(1) default 'N',
	point		number(5)	
);
create sequence event_seq
drop sequence event_seq

insert into member values('b','1234','문','rdans25','jw89082@gmail.com','11111','안양시','010-1111-1111','i.png','1',sysdate)
insert into attend_check values (4,'b','2021-10-06','N',30)
insert into attend_check values(event_seq.nextval,'a','2021-10-06','N',
                              nvl((select point from attend_check
                                   where num=(select nvl(max(num),0)
                                   from ATTEND_CHECK where id='a')),0))
insert into attend_check values ('a',TO_CHAR(sysdate,'YYYY-MM-DD'))
delete from ATTEND_CHECK where id='a'
select * from attend_check
select * from member

 select nvl(max(point),0) point from attend_check where id='a'
      				and num=(select nvl(max(num),0)
                                   from ATTEND_CHECK where id='a')
update ATTEND_CHECK set status='N', point= point+20 where id='a' and attenddate=TO_CHAR(sysdate,'YYYY-MM-DD')

select * from attend_check where id='a' and TO_CHAR(attenddate,'YYYY-MM-DD')= '2021-10-02'

select count(*) from ATTEND_CHECK where id='a' and TO_CHAR(attenddate,'YYYY-MM') ='2021-10'