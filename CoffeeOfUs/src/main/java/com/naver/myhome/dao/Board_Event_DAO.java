package com.naver.myhome.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Board_Event;

@Repository
public class Board_Event_DAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	public int insertBoardEvent(Board_Event board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board_event.insert",board);
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board_event.count");
	}

	public List<Board_Event> getList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board_event.getList",map);
	}

	public int BoardUpdate(Board_Event board) {
		// TODO Auto-generated method stub
		return sqlSession.update("board_event.BoardUpdate",board);
	}

	public int BoardReplyUpdate(Board_Event board) {
		// TODO Auto-generated method stub
		return sqlSession.update("board_event.BoardReplyUpdate",board);
	}

	public int BoardReply(Board_Event board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board_event.BoardReply",board);
	}

	public int BoardDelete(Board_Event board) {
		// TODO Auto-generated method stub
		return sqlSession.delete("board_event.BoardDelete",board);
	}

	public Board_Event BoardSelect(Board_Event board) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board_event.BoardSelect",board);
	}

	
}
