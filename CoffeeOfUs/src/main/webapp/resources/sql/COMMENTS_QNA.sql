drop table COMMENTS_QNA CASCADE CONSTRAINTS;

create table COMMENTS_QNA(
	NUM			number		primary key,
	ID			varchar2(50), --references member(id),
	CONTENT		varchar2(200),
	REG_DATE	date,
	QNA_NUM	number references BOARD_QNA(QNA_NUM)
				on delete cascade
);


select *from COMMENTS_QNA;

insert into COMMENTS_QNA values('26', 'user07', '유져7번', '2021-10-15 12:12:32.0', '17');

  drop sequence com_seq;
create sequence COMMENTS_QNA_SEQ;


delete from COMMENTS_QNA where NUM =47;



