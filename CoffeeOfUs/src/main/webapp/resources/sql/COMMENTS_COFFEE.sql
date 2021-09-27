drop table COMMENTS_COFFEE CASCADE CONSTRAINTS;

create table COMMENTS_COFFEE(
	NUM			number		primary key,
	ID			varchar2(30), --references member2(id),
	CONTENT		varchar2(200),
	REG_DATE	date,
	COFFEE_NUM	number references COFFEE(COFFEE_NUM)
				on delete cascade
);

  drop sequence COMMENTS_COFFEE_SEQ;
create sequence COMMENTS_COFFEE_SEQ;

select *from COMMENTS_COFFEE;


select 	count(*)
		from	COMMENTS_COFFEE
		where	COFFEE_NUM = 0



select board_num, count(*) CNT
from comments
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