drop table product CASCADE CONSTRAINTS;
--1. index.jsp���� ���� �մϴ�.
--2. ������ ���� admin, ��� 1234�� ����ϴ�.
--3. ����� ������ 3�� ����ϴ�.

create table product (
	num			number ,
    code 		number primary key,
    productname varchar2(50) not null,
    description varchar2(50) not null,
    perpoint	number not null,
    quantity 	number(2) not null,
    img		varchar2(40) not null
);
create sequence product_seq





--위에 테이블, 시퀀스까지 생성해주세요
drop sequence event_seq
--insert into product values(1,1001,'브라질 세하도','맛있어요',50,50,'/brazil.png');
--insert into product values(2,1002,'과테말라 안티구아','향이 기가 막혀요',100,60,'/gua.png');
--insert into product values(3,1003,'에티오피아 모카','조금 써요',150,40,'/etiopia.png');
insert into product values(11,1004,'에스프레소(별다방)','조금 달아요',150,50,'/espressoStart.png');
insert into product values(10,1005,'에스프레소(시그니처)','새콤해요',200,80,'/espressoSign.png');
--insert into product values(6,1006,'에스프레소(신사)','많이 써요',200,70,'/espresso(Sin).png');
insert into product values(9,1007,'에스프레소(아우라)','많이 달아요',250,40,'/espressoaura.png');
insert into product values(8,1008,'에스프레소(여왕)','엄청 고소해요',250,50,'/espressoQueen.png');
insert into product values(7,1009,'에스프레소(연인)','조금 셔요',300,60,'/espressoCouple.png');
insert into product values(6,1010,'에스프레소(이태리)','많이 셔요',350,70,'/espressoItely.png');
--insert into product values(11,1011,'예맨 모카','적극 추천해요',100,60,'/yemen.png');
insert into product values(5,1012,'온두라스','향이 진짜 좋아요',150,50,'/ondu.png');
insert into product values(4,1013,'인도네시아 만델링','많이 고소해요',400,40,'/indonesia.png');
insert into product values(3,1014,'케냐AA','고소하고 맛있어요',350,40,'/kena.png');
insert into product values(2,1015,'코스타리카 따라주','중독성 있어요',220,50,'/cos.png');
insert into product values(1,1016,'콜롬비아 수프리모','달고 향이 좋아요',180,60,'/col.png');
--insert into product values(17,1017,'탄자니아 AAA','쓴데 중독성 있어요',500,70,'/tan.png');
--insert into product values(18,1018,'하우스 블랜드','호불호가 갈려요 ',450,80,'/house.png');


delete from product
select * from PRODUCT

