package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Board_Event_DAO;
import com.naver.myhome.domain.Board_Event;

@Service
public class Board_Event_ServiceImpl implements Board_Event_Service {

	@Autowired
	Board_Event_DAO dao;

	@Override
	public int insertEvent(Board_Event board) {
		// TODO Auto-generated method stub
		return dao.insertBoardEvent(board);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return dao.getListCount();
	}

	@Override
	public List<Board_Event> getList(int state, int page, int limit) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		map.put("state", state);
		map.put("startrow", startrow);
		map.put("endrow", endrow);

		return dao.getList(map);
	}

	@Override
	public int BoardUpdate(Board_Event board) {
		// TODO Auto-generated method stub
		return dao.BoardUpdate(board);
	}

	@Override
	public int BoardReplyUpdate(Board_Event board) {

		return dao.BoardReplyUpdate(board);
	}

	@Override
	public int BoardReply(Board_Event board) {
		BoardReplyUpdate(board);
		board.setEvent_re_lev(board.getEvent_re_lev() + 1);
		board.setEvent_re_seq(board.getEvent_re_seq() + 1);

		return dao.BoardReply(board);
	}

	@Override
	public Board_Event BoardSelect(Board_Event board) {

		return dao.BoardSelect(board);
	}

	@Override
	public int BoardDelete(Board_Event board) {

		Board_Event boarddetail = BoardSelect(board);

		return dao.BoardDelete(boarddetail);
	}

}
