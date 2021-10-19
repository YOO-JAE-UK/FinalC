package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Main_DAO;
import com.naver.myhome.domain.CRAWLER;


@Service
public class Main_ServiceImpl implements Main_Service {
	@Autowired
	private Main_DAO dao;

	@Override
	public List<CRAWLER> getlist() {
		return dao.getList();
	}

	@Override
	public int insert(CRAWLER bean) {
		return dao.insertList(bean);
	}
	

	
	
}
