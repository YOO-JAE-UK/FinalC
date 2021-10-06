package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Board_Tour_DAO;
import com.naver.myhome.domain.Board_Coffee;
import com.naver.myhome.domain.Board_Tour;

@Service
public class Board_Tour_ServiceImpl implements Board_Tour_Service {

	@Autowired
	private Board_Tour_DAO dao;
	
	@Override
	public void add(Board_Tour board) {
		dao.add(board);
	}
	@Override
	public void add_admin(Board_Tour board) {
		dao.add_admin(board);
		
	}
	
	@Override
	public List<Board_Tour> getBoardList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow =startrow+limit-1;
		map.put("start",startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}
	
	@Override
	public List<Board_Tour> getBoardList(String sido) {
		return dao.getBoardList(sido);
	}

	@Override
	public int getListCount() {
		return dao.getListCount();
	}

	@Override
	public Board_Tour getDetail(int num) {
		if(setReadCountUpdate(num) !=1)
			return null; //조회수 +1이 실행되지 않으면 null반환
		return dao.getDetail(num);
	}
	
	@Override
	public int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
	}

	@Override
	public int boardModify(Board_Tour modifyboard) {
		return dao.boardModify(modifyboard);
	}

	@Override
	public int insert_deleteFile(String before_file) {
		return dao.insert_deleteFile(before_file);
		
	}

	@Override
	public Board_Tour getDetail(String name) {
		return dao.getDetail_one(name);
	}
	@Override
	public String isname(String tour_NAME) {
		return dao.getIsName(tour_NAME);
	}

	


	
	
}
