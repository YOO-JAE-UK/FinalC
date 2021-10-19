package com.naver.myhome.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Coffee_Bean_DAO;
import com.naver.myhome.domain.Bean;

@Service
public class Coffee_Bean_ServiceImpl implements Coffee_Bean_Service {

	@Autowired
	private Coffee_Bean_DAO dao;

	@Override
	public void add(Bean bean) {
		dao.bean_add(bean);
		
	}

	@Override
	public int getListCount(String search_text) {
		return dao.getListCount(search_text);
	}

	@Override
	public List<Bean> getList(int page, int limit, String search_text) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow=1;
		int endrow =page*12;
		map.put("start",startrow);
		map.put("end", endrow);
		map.put("search_text", search_text);
		return dao.getList(map);
	}

	@Override
	public Bean getDetail(int num) {
		return dao.getDetail(num);
	}

	@Override
	public Bean getDetail(String cake, String apple, String roasting) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cake", cake);
		map.put("apple", apple);
		map.put("roasting", roasting);
		return dao.getTest_Detail(map);
	}

	@Override
	public int boardModify(Bean modifyboard) {
		return dao.boardModify(modifyboard);
	}

	@Override
	public int insert_deleteFile(String before_file) {
		return dao.insert_deleteFile(before_file);
		
	}

	






	
}
