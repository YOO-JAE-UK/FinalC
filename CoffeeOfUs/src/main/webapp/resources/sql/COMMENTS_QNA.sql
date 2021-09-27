drop table COMMENTS_QNA CASCADE CONSTRAINTS;

create table COMMENTS_QNA(
	NUM			number		primary key,
	ID			varchar2(30), --references member2(id),
	CONTENT		varchar2(200),
	REG_DATE	date,
	QNA_NUM	number references BOARD_QNA(QNA_NUM)
				on delete cascade
);


  drop sequence com_seq;
create sequence COMMENTS_QNA_SEQ;

select *from comments;
select *from COMMENTS_QNA;

select board_num, count(*) CNT
from COMMENTS_QNA
GROUP BY board_num






SELECT A.BOARD_NUM, A.BOARD_NAME, A.BOARD_SUBJECT, A.BOARD_CONTENT, A.BOARD_ORIGINAL, A.BOARD_RE_LEV, A.BOARD_RE_SEQ, A.BOARD_DATE, NVL(B.CNT,0) CNT
FROM BOARD A, 
(select board_num, count(*) CNT
from comments
GROUP BY board_num) B
WHERE A.BOARD_NUM = B.board_num(+)
ORDER BY A.BOARD_NUM DESC;

<-- ���� -->
SELECT board.*, nvl(cnt,0) cnt
from board left outer join (select board_num, count(*) cnt
							from COMMENTS
							group by board_num) c
on board.board_num = c.board_num
order by BOARD_RE_REF desc,
BOARD_RE_SEQ asc;