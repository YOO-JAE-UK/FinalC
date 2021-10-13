package com.naver.myhome.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Coffee_Find_DAO;
import com.naver.myhome.domain.Coffee;

@Service
public class Coffee_ServiceImpl implements Coffee_Service {

	@Autowired
	private Coffee_Find_DAO dao;

	@Override
	public List<Coffee> getList() {
		return dao.getList();
		
	}

	@Override
	public String getword_content(String word) {
		return dao.getContent(word);
	}

	@Override
	public int add_word(Coffee coffee) {
		return dao.add_word(coffee);
	}






	
}
