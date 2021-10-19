package com.naver.myhome.service;


import java.util.List;

import com.naver.myhome.domain.Bean;


public interface Coffee_Bean_Service {

	public void add(Bean bean);

	public int getListCount(String search_text);

	public List<Bean> getList(int page, int limit, String search_text);

	public Bean getDetail(int num);

	public Bean getDetail(String cake, String apple, String roasting);

	public int boardModify(Bean boarddata);

	public int insert_deleteFile(String before_file);

	
}
