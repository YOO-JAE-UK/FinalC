package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Board_Tour;

@Repository //외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Board_Tour_DAO {
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public void add(Board_Tour board) {
			sqlSession.insert("Boards_Tour.insert",board);
		}
		public void add_admin(Board_Tour board) {
			sqlSession.insert("Boards_Tour.insert_admin",board);	
		}

		public int getListCount() {
			return sqlSession.selectOne("Boards_Tour.count");
		}
		
		public List<Board_Tour> getBoardList(HashMap<String, Integer> map) {
			return sqlSession.selectList("Boards_Tour.list",map);
		}

		public Board_Tour getDetail(int num) {
			return sqlSession.selectOne("Boards_Tour.detail",num);
		}
		
		public int setReadCountUpdate(int num) {
			return sqlSession.update("Boards_Tour.readCountUpdate",num);
		}
		
		public Board_Tour getfindfile(HashMap<String, String> map){
			return sqlSession.selectOne("Boards_Tour.findfile",map);
		}
		
		public int boardModify(Board_Tour modifyboard) {
			return sqlSession.update("Boards_Tour.modify",modifyboard);
		}

		public int insert_deleteFile(String before_file) {
			return sqlSession.insert("Boards_Tour.insert_deleteFile",before_file);
		}

		public List<Board_Tour> getBoardList(String sido) {
			return sqlSession.selectList("Boards_Tour.list_map",sido);
		}

		public Board_Tour getDetail_one(String name) {
			return sqlSession.selectOne("Boards_Tour.detail_one",name);
		}
		public String getIsName(String tour_NAME) {
			return sqlSession.selectOne("Boards_Tour.isname",tour_NAME);
		}

		
		
}
