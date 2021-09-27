
  package com.naver.myhome.service;
  
  import java.util.List;
  
  import com.naver.myhome.domain.Comment_Qna;
  
  public interface Comment_Qna_Service { 
	  //글의 갯수 구하기
	  public int getListCount(int board_num);
	  
	  //댓글 목록 가져오기 
	  public List<Comment_Qna> getCommentList(int board_num, int  page);
	  
	  public int commentsInsert(Comment_Qna co);
	  
	  public int commentsDelete(int num);
	  
	  public int commentsUpdate(Comment_Qna co); 
  }
	  
  
  
 