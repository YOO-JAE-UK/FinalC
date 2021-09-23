package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Board_Coffee;

@Repository //외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Board_Coffee_DAO {
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public int getListCount() {
			return sqlSession.selectOne("Boards_Coffee.count");
		}
		
		public List<Board_Coffee> getBoardList(HashMap<String, Integer> map){
			return sqlSession.selectList("Boards_Coffee.list",map);
		}

		public void insertBoard(Board_Coffee board) {
			sqlSession.insert("Boards_Coffee.insert",board);
			
		}
		public int setReadCountUpdate(int num) {
			return sqlSession.update("Boards_Coffee.readCountUpdate",num);
		}
		public Board_Coffee getDetail(int num) {
			return sqlSession.selectOne("Boards_Coffee.detail",num);
		}

		public int boardReply(Board_Coffee board) {
			return sqlSession.insert("Boards_Coffee.reply_insert",board);
		}
		
		public int boardReplyUpdate(Board_Coffee board) {
			return sqlSession.update("Boards_Coffee.reply_update",board);
		}

		public Board_Coffee isBoardWriter(Map<String, Object> map) {
			return sqlSession.selectOne("Boards_Coffee.boardWriter",map);
		}
		
		public int boardModify(Board_Coffee modifyboard) {
			return sqlSession.update("Boards_Coffee.modify",modifyboard);
		}

		public int boardDelete(Board_Coffee board) {
			return sqlSession.delete("Boards_Coffee.delete",board);
		}
		
		public int insert_deleteFile(String before_file) {
			return sqlSession.insert("Boards_Coffee.insert_deleteFile",before_file);
		}

		public List<String> getDeleteFileList() {
			return sqlSession.selectList("Boards_Coffee.deleteFileList");
		}
}
