  package com.naver.myhome.service;
  
  import java.util.HashMap; 
  import java.util.List; 
  import java.util.Map;
  
  import org.springframework.beans.factory.annotation.Autowired; 
  import org.springframework.stereotype.Service; 
  import org.springframework.transaction.annotation.Transactional;
  
  import com.naver.myhome.dao.Board_Qna_DAO; 
  import com.naver.myhome.domain.Board_Qna;
  
  @Service 
  public class Board_Qna_ServiceImpl implements Board_Qna_Service {
  
  @Autowired 
  private Board_Qna_DAO dao;
  
  @Override 
  public int getListCount() {
	  return dao.getListCount(); 
  }
  
  @Override 
  public List<Board_Qna> getBoardList(int page, int limit) { 
	  //double i = 1/0; 
	  HashMap<String, Integer> map = new HashMap<String, Integer>(); 
	  int startrow=(page-1)*limit+1; 
	  int endrow =startrow+limit-1;
	  map.put("start",startrow); 
	  map.put("end", endrow); 
	  return dao.getBoardList(map); 
   }
  
  @Transactional 
  public Board_Qna getDetail(int num) {
	  if(setReadCountUpdate(num) !=1) 
		  return null; 
	  //double i=1/0; //rollback 되는지  확인합니다. 
	  return dao.getDetail(num); 
  }
  
  @Override 
  public int boardReplyUpdate(Board_Qna board) { 
	  return dao.boardReplyUpdate(board); 
  }
  
  @Transactional 
  public int boardReply(Board_Qna board) {
	  boardReplyUpdate(board); 
	  board.setQNA_RE_LEV(board.getQNA_RE_LEV()+1);
	  board.setQNA_RE_SEQ(board.getQNA_RE_SEQ()+1); 
	  return dao.boardReply(board); 
  }
  
  @Override 
  public int boardModify(Board_Qna modifyboard) { 
	  return dao.boardModify(modifyboard); 
  }
  
  @Override 
  public int boardDelete(int num) { 
	  int result=0; 
	  Board_Qna board= dao.getDetail(num); 
	  if(board !=null) { 
		  result =dao.boardDelete(board);
  
		  //추가 - 삭제할 파일 목록들을 저장하기 위한 메서드 호출 
		  if(board.getQNA_FILE()!=null)
			  dao.insert_deleteFile(board.getQNA_FILE()); 
		  } 
	  return result; 
  }
    
  @Override 
  public int setReadCountUpdate(int num) { 
	  return dao.setReadCountUpdate(num); 
  }
  
  @Override 
  public boolean isBoardWriter(int num, String pass) { 
	  Map<String, Object> map = new HashMap<String, Object>(); 
	  map.put("num",num);
	  map.put("pass", pass); 
	  Board_Qna result = dao.isBoardWriter(map); 
	  if(result==null) 
		  return false; 
	  else 
		  return true; 
  }
  
  @Override 
  public void insertBoard(Board_Qna board) { 
	  dao.insertBoard(board);
  
  }
  
  @Override 
  public int insert_deleteFile(String before_file) { 
	  return dao.insert_deleteFile(before_file);
  
  }
  
  @Override public List<String> getDeleteFileList() { 
	  return dao.getDeleteFileList(); 
  } 
 
}
 