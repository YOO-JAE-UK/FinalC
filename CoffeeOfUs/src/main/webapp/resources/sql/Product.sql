drop table product CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table product (
	num			number ,
    code 		number primary key,
    productname varchar2(20) not null,
    description varchar2(50) not null,
    perpoint	number not null,
    quantity 	number(2) not null,
    img		varchar2(40) not null
);
create sequence product_seq





--위에 테이블, 시퀀스까지 생성해주세요
drop sequence event_seq
insert into product values(1,1001,'배추','맛있어요',50,40,'/product-1.jpg')
insert into product values(2,1002,'샐러드','엄청 맛있어요',100,30,'/product-2.jpg')
insert into product values(3,1003,'토마토','엄청 달아요',200,50,'/product-3.jpg')
insert into product values(4,1004,'양상추','엄청 싫어요',300,60,'/product-4.jpg')

delete from PRODUCT
select * from PRODUCT

