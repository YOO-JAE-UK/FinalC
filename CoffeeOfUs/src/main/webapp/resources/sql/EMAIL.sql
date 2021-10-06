drop table EMAIL;

create table EMAIL(
	id          varchar2(20), 
    email  	    varchar2(30) references member(USER_EMAIL),
    emailkey   	varchar2(60),
    keycheck    number(1) default 0
);

select *from email;

insert into email values('user01@naver.com', 'emailkey_test');

delete from email where ID= 'a';