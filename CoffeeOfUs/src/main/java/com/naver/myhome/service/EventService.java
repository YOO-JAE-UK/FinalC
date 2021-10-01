package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.AttendCheckMember;

public interface EventService {

	public int add(String id);

	public List<AttendCheckMember> getList(String id);

	public  AttendCheckMember  isCheck(String id,String attenddate);

	public int attendCount(String id, String start,String end);

}
 