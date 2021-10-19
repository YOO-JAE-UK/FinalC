drop table attend_check CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table attend_check(
	num			number primary key,
    id			varchar2(20) references member(user_id) on delete cascade,
	attenddate	 date,
	status       varchar2(1) default 'N',
	point		number(5)	
);
create sequence event_seq
drop sequence event_seq

--위 테이블,시퀀스까지 생성해주시면 됩니다.
insert into member values('b','1234','aaf문','aardans25d','aajw89082f@gmail.com','11111','안양시','010-1111-1111',null,'i.png','1',sysdate)
insert into attend_check values (4,'b','2021-10-06','N',30)
≈
insert into attend_check values(event_seq.nextval,'a','2021-10-06','N',
                              nvl((select point from attend_check
                                   where num=(select nvl(max(num),0)
                                   from ATTEND_CHECK where id='a')),0))
select * from EMAIL
update email set keycheck=1 where keycheck=0
delete from ATTEND_CHECK where id='b'
select * from attend_check
select * from member
update member set user_check=1 where user_check=0
delete from member where user_id='a'
select * from BOARD_EVENT
delete from board_event where id='a'

 select nvl(max(point),0) point from attend_check where id='a'
      				and num=(select nvl(max(num),0)
                                   from ATTEND_CHECK where id='a')
update ATTEND_CHECK set status='N', point= point+20 where id='a' and attenddate=TO_CHAR(sysdate,'YYYY-MM-DD')

select * from attend_check where id='a' and TO_CHAR(attenddate,'YYYY-MM-DD')= '2021-10-02'

select count(*) from ATTEND_CHECK where id='a' and TO_CHAR(attenddate,'YYYY-MM') ='2021-10'

	update attend_check set point=20 where id='b' and num= (select nvl(max(num),0)
                                   from ATTEND_CHECK where id='b')
