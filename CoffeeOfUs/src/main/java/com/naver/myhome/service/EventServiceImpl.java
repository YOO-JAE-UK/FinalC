package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.eventDAO;
import com.naver.myhome.domain.AttendCheckMember;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private eventDAO dao;
	
	@Override
	public int add(String id) {
		return dao.insert(id);
	}

	@Override
	public List<AttendCheckMember> getList(String id) {
		// TODO Auto-generated method stub
		return dao.getList(id);
	}

	@Override
	public  AttendCheckMember isCheck(String id,String attenddate) {
		
		HashMap<String,Object> map= new HashMap<String,Object>(); 
		map.put("id", id);
		map.put("attenddate",attenddate);
		// TODO Auto-generated method stub
		return dao.isCheck(map);
	}

	@Override
	public int attendCount(String id, String start,String end) {
		HashMap<String,Object> map= new HashMap<String,Object>(); 
		map.put("id", id);
		map.put("start",start);
		map.put("end",end);
		return dao.attendCount(map);
	}

	

}
