package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Board_Tour;

public interface Board_Tour_Service {
	
	//투어 게시판 등록
	public void add(Board_Tour board);

	//투어 게시판 불러오기
	//public List<Board_Tour> getBoardList(int page);

	//투어 총게시글수
	public int getListCount(int page, int search_type, String search_text);

	//투어 디테일페이지
	public Board_Tour getDetail(int num);

	//조회수 1증가
	int setReadCountUpdate(int num);
	
	// 투어 글 수정
	public int boardModify(Board_Tour modifyboard);


	//ajax list_map 가져오기
	public List<Board_Tour> getBoardList(String sido);

	//ajax list_map_detail_one 이름으로 가져오기 0이면 num이제일낮은거 1이면 1만
	public Board_Tour getDetail(String name, String sido);
	//투어 게시판 관리자등록
	public void add_admin(Board_Tour board);

	//관리자모드 map 등록
	public String isname(String tour_NAME);

	public List<Board_Tour> getManage_List(int page, int limit, int search_type, String search_text);

	//글 삭제
	public int boardDelete(int num);
	
	//수정후 -원래있던 파일 테이블에 올림 (나중에 삭제)
	public int insert_deleteFile(String before_file);
		
	//삭제할 파일 리스트 가져오기
	public List<String> getDeleteFileList();

	//관리자 글 갯수 
	public int getManaeListCount( int search_type, String search_text);

	public List<Board_Tour> getBoardList(int page, int search_type, String search_text);
	
}
