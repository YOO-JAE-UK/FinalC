package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Comment_Coffee;

public interface Comment_Coffee_Service {
	//글의 갯수 구하기
	public int getListCount(int board_num);
	
	//댓글 목록 가져오기
	public List<Comment_Coffee> getCommentList(int board_num, int page);

	public int commentsInsert(Comment_Coffee co);

	public int commentsDelete(int num);

	public int commentsUpdate(Comment_Coffee co);
}
