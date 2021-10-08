package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Board_Tour_DAO;
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
	public List<Board_Tour> getBoardList(int page) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=1;
		int endrow =(page*4)+4;
		map.put("start",startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}
	
	@Override
	public List<Board_Tour> getManage_List(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow =startrow+limit-1;
		map.put("start",startrow);
		map.put("end", endrow);
		return dao.getManage_List(map);
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
			return null; //議고쉶�닔 +1�씠 �떎�뻾�릺吏� �븡�쑝硫� null諛섑솚
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
	public Board_Tour getDetail(String name) {
		return dao.getDetail_one(name);
	}
	@Override
	public String isname(String tour_NAME) {
		return dao.getIsName(tour_NAME);
	}

	@Override
	public int boardDelete(int num) {
		int result=0;
		Board_Tour board= dao.getDetail(num);
		if(board !=null) {
			result =dao.boardDelete(num);
			
			//異붽� - �궘�젣�븷 �뙆�씪 紐⑸줉�뱾�쓣 ���옣�븯湲� �쐞�븳 硫붿꽌�뱶 �샇異�
			if(board.getTOUR_FILE()!=null)
				dao.insert_deleteFile(board.getTOUR_FILE());
		}
		return result;
	}

	@Override
	public int insert_deleteFile(String before_file) {
		return dao.insert_deleteFile(before_file);
		
	}

	@Override
	public List<String> getDeleteFileList() {
		return dao.getDeleteFileList();
	}



	
	
}
