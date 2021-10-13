drop table board_event CASCADE CONSTRAINTS;


create table board_event(
 event_board_num number primary key,
 id       varchar2(30) references member(USER_ID), 
 content  varchar2(200) ,
 event_re_ref	number,
 event_re_lev number(1) check(event_re_lev in (0,1,2)),
 event_re_seq number,
 reg_date   date

);

create table MEMBER(
	USER_ID			   varchar2(20)  primary key,  --아이디
	USER_PASS	       varchar2(20)  NOT NULL,  --패스워드 
	USER_NAME		   varchar2(20)  NOT NULL,  --이름
	USER_NICKNAME	   varchar2(20)  NOT NULL unique,  --닉네임
	USER_EMAIL		   varchar2(30)  NOT NULL unique,  --이메일
	USER_ADDRESS_POST  varchar2(5)   NOT NULL,  --우편번호
	USER_ADDRESS       varchar2(100) NOT NULL,  --우편주소
	USER_PHONE         varchar2(20)  NOT NULL,  --핸드폰
	USER_FILE          varchar2(100) ,
	USER_IMG           varchar2(100) NOT NULL,  --유저이미지
	USER_CHECK         char(1) check(USER_CHECK='0' or USER_CHECK='1'),   --당일체크
	USER_LASTLOGIN     DATE default sysdate     --최근로그인날짜
);

select * from
  	( select rownum rnum, b.*
  	 from 
  	 	(select event_board_num, 
	     id, content, event_re_ref,
	     event_re_lev, event_re_seq,
	     reg_date, c.user_file from board_event a join member c
	     on a.id=c.user_id
  	 	 order by event_RE_REF desc,
  	 	 event_RE_SEQ asc) b
  	 )
  	 
  	 where rnum >1 and rnum < 3		
 


select * from member
select * from board_event
delete from BOARD_EVENT