package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Coffee;

public interface Coffee_Service {

	public List<Coffee> getList();

	public String getword_content(String word);

	public int add_word(Coffee coffee);
	
}
