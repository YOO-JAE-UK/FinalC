package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	/*
	@Override
	public List<Board_Tour> getBoardList(int page) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=1;
		int endrow =(page*4)+4;
		map.put("start",startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}
	*/
	
	
	@Override
	public List<Board_Tour> getBoardList(String sido) {
		return dao.getBoardList(sido);
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
	public Board_Tour getDetail(String name,String sido) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("sido", sido);
		return dao.getDetail_one(map);
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
			
			//추가 - 삭제할 파일 목록들을 저장하기 위한 메서드 호출
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
	
	@Override
	public int getManaeListCount(int search_type, String search_text) {
		Map<String,String> map = new HashMap<String, String>();
		if(search_type !=-1) {
			String[] search_field = new String[] {"TOUR_SUBJECT","TOUR_NAME","TOUR_CONTENT","USER_NICKNAME"};
			map.put("search_type", search_field[search_type]);
			map.put("search_text","%"+search_text +"%");
		}
		return dao.getManageListCount(map);
	}
	
	@Override
	public int getListCount(int page, int search_type, String search_text) {
		Map<String,String> map = new HashMap<String, String>();
		if(search_type !=-1) {
			String[] search_field = new String[] {"TOUR_SUBJECT","TOUR_NAME","TOUR_CONTENT","USER_NICKNAME"};
			map.put("search_type", search_field[search_type]);
			map.put("search_text","%"+search_text +"%");
		}
		return dao.getListCount(map);
	}

	@Override
	public List<Board_Tour> getBoardList(int page, int search_type, String search_text) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			if(search_type !=-1) {
			String[] search_field = new String[] {"TOUR_SUBJECT","TOUR_NAME","TOUR_CONTENT","USER_NICKNAME"};
			map.put("search_type",search_field[search_type]);
			map.put("search_text","%"+search_text+"%");
			}
			int startrow=1;
			int endrow =(page*4)+4;
			map.put("start",startrow);
			map.put("end", endrow);
			
			return dao.getBoardList(map);
	}
	@Override
	public List<Board_Tour> getManage_List(int page, int limit, int search_type, String search_text) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(search_type !=-1) {
		String[] search_field = new String[] {"TOUR_SUBJECT","TOUR_NAME","TOUR_CONTENT","USER_NICKNAME"};
		map.put("search_type",search_field[search_type]);
		map.put("search_text","%"+search_text+"%");
		}
		
		int startrow=(page-1)*limit+1;
		int endrow =startrow+limit-1;
		map.put("start",startrow);
		map.put("end", endrow);

		return dao.getManage_List(map);
	}


	
}
