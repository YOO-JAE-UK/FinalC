drop table cart CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table cart (
	id			varchar2(20) references member(user_id) on delete cascade ,
    ccode 		number primary key,
    cproductname varchar2(20) not null,
    cdescription varchar2(50) not null,
    cperpoint	number not null,
    cquantity 	number(2) not null,
    cimg		varchar2(40) not null,
    ctotalpoint  number not null,
    cdate		date
);







--위에 테이블만 생성해주시면 됩니다.

drop sequence event_seq
select * from cart
select * from PRODUCT

select * from  (select rownum rnum,b.* from (select * from cart where id='b' order by cdate desc )b ) where rnum>=1 and rnum<=3

select * from ( select rownum rnum,b.* from (select
	cart.*,product.quantity cremain from cart,PRODUCT
	where cart.ccode=product.code
	and id='b'
	order by cdate desc 
)b)
where rnum >=1 and rnum <=3

update (select product.quantity,product.code
               from product join cart on cart.ccode=product.code
								where cart.id='b')
			set quantity = quantity -(select cquantity from cart 
										where code=ccode)
	
			
