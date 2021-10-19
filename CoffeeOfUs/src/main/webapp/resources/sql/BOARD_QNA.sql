drop table BOARD_QNA CASCADE CONSTRAINTS;

create table BOARD_QNA(
    QNA_NUM	       NUMBER       NOT NULL,   --글번호
    QNA_PASS	   VARCHAR2(20)	NOT NULL,   --비밀번호
    QNA_SUBJECT	   VARCHAR2(40)	NOT NULL,   --제목
    USER_ID	       VARCHAR2(50) references member(USER_ID) on delete cascade,   --아이디
    USER_NICKNAME  VARCHAR2(50)	,   --닉네임
    QNA_CONTENT	   VARCHAR2(4000) NOT NULL,	--내용
    QNA_FILE	   VARCHAR2(100),	        --첨부 파일 명(가공)
	QNA_ORIGINAL   VARCHAR2(100),	        --첨부 파일 명
    QNA_DATE	   DATE	NOT NULL,           --등록 날짜
    QNA_READCOUNT  NUMBER NOT NULL,	        --글의 조회수
    QNA_RE_REF	   NUMBER,	                --답변 글 작성시 참조되는 글의 번호
    QNA_RE_LEV	   NUMBER CHECK(QNA_RE_LEV IN(0,1)),  --답변 글의 깊이
    QNA_RE_SEQ	   NUMBER,	                --답변 글의 순서
    PRIMARY KEY(QNA_NUM)
);

select * from BOARD_QNA;

insert into BOARD_QNA values(1,'1234','테스트 게시물','user01', '장군', '첫 테스트 게시 내용', NULL,NULL,SYSDATE,0,0,0,0);

alter table board_qna modify QNA_SUBJECT varchar2(60); 
