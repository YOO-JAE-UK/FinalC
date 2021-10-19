drop table EMAIL;

create table EMAIL(
	id          varchar2(20) references member(USER_ID) on delete cascade, 
    email  	    varchar2(30),
    emailkey   	varchar2(60),
    keycheck    number(1) default 0
);

select *from email;

insert into email values('user01@naver.com', 'emailkey_test');

delete from email where id= 'user03';

update email set keycheck='1' where id='user02';

update member set USER_ID='admin' where USER_ID='ID중복체크,admin';  


alter table EMAIL add FOREIGN KEY(email) REFERENCES member(USER_EMAIL);