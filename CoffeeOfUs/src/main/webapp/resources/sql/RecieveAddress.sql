drop table raddress CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table raddress (
	rnum	number primary key,
    id		varchar2(20) references member(USER_ID)on delete cascade,
	rname   varchar2(20) not null,
	rtel    varchar2(20) not null,
	rplace  varchar2(20) not null,
	rpost 	varchar2(5)	not null,
	raddress varchar2(100) not null,
	rdate   date,
	rcheck   number(1) check(rcheck in(0,1))
);
create sequence raddress_seq

select * from raddress
delete from raddress;

--위에 테이블, 시퀀스까지 생성해주세요
drop sequence event_seq
insert into product values(1,1001,'배추','맛있어요',50,40,'/product-1.jpg')
insert into product values(2,1002,'샐러드','엄청 맛있어요',100,30,'/product-2.jpg')
insert into product values(3,1003,'토마토','엄청 달아요',200,50,'/product-3.jpg')
insert into product values(4,1004,'양상추','엄청 싫어요',300,60,'/product-4.jpg')

delete from PRODUCT
select * from PRODUCT

