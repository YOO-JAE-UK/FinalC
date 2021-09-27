package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Comment_Qna_DAO;

import com.naver.myhome.domain.Comment_Qna;

@Service
public class Comment_Qna_ServiceImpl implements Comment_Qna_Service {
	@Autowired
	private Comment_Qna_DAO dao;

	@Override
	public int getListCount(int board_num) {
		return dao.getListCount(board_num);
	}

	@Override
	public List<Comment_Qna> getCommentList(int board_num, int page) {
		int startrow = 1;
		int endrow = page * 3;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getCommentList(map);
	}

	@Override
	public int commentsInsert(Comment_Qna c) {
		return dao.commentsInsert(c);
	}

	@Override
	public int commentsDelete(int num) {
		return dao.commentDelete(num);
	}

	@Override
	public int commentsUpdate(Comment_Qna co) {
		return dao.commentUpdate(co);
	}

}
