
  package com.naver.myhome.service;
  
  import java.util.List;
  
  import com.naver.myhome.domain.Board_Qna;
  
  public interface Board_Qna_Service { 
	  
	  // 글의 갯수 구하기 
	  public int getListCount();
 
  
	  //글 목록 보기 
	  public List<Board_Qna> getBoardList(int page, int limit);
  
	  //글 내용 보기 
	  public Board_Qna getDetail(int num);
  
	  //글 답변 
	  public int boardReply(Board_Qna board);
  
	  // 글 수정
	  public int boardModify(Board_Qna modifyboard);
  
 	  //글 삭제 
	  public int boardDelete(int num);
  
	  //조회수 업데이트 
	  public int setReadCountUpdate(int num);
  
	  //글쓴이인지 확인 
	  public boolean isBoardWriter(int num, String pass);
  
	  // 글 등록하기 
	  public void insertBoard(Board_Qna board);
  
	  //BOARD_RE_SEQ값 수정 
	  public int boardReplyUpdate(Board_Qna board);
  
	  //삭제할 파일을 삽입 
	  public int insert_deleteFile(String before_file);
  
	  //삭제할 파일 리스트 가져오기 
	  public List<String> getDeleteFileList(); 
  }
 