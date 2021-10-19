package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.CRAWLER;

public interface Main_Service {

	List<CRAWLER> getlist();

	int insert(CRAWLER bean);

}
