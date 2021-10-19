package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Board_Event;

public interface Board_Event_Service {

	int insertEvent(Board_Event board);

	int getListCount();

	List<Board_Event> getList(int state, int page, int limit);

	int BoardUpdate(Board_Event board);

	int BoardReply(Board_Event board);

	int BoardReplyUpdate(Board_Event board);

	int BoardDelete(Board_Event board);

	Board_Event BoardSelect(Board_Event board);

}
