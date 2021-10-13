package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Board_Event;

public interface Board_Event_Service {

	int insertEvent(Board_Event board);

	int getListCount();

	List<Board_Event> getList(int state, int page, int limit);

}
