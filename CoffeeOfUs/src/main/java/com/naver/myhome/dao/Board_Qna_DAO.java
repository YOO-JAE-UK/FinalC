package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Board_Qna;

@Repository // 외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Board_Qna_DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("Boards_Qna.count");
	}

	public List<Board_Qna> getBoardList(HashMap<String, Integer> map) {
		return sqlSession.selectList("Boards_Qna.list", map);
	}

	public void insertBoard(Board_Qna board) {
		sqlSession.insert("Boards_Qna.insert", board);

	}

	public int setReadCountUpdate(int num) {
		return sqlSession.update("Boards_Qna.readCountUpdate", num);
	}

	public Board_Qna getDetail(int num) {
		return sqlSession.selectOne("Boards_Qna.detail", num);
	}

	public int boardReply(Board_Qna board) {
		return sqlSession.insert("Boards_Qna.reply_insert", board);
	}

	public int boardReplyUpdate(Board_Qna board) {
		return sqlSession.update("Boards_Qna.reply_update", board);
	}

	public Board_Qna isBoardWriter(Map<String, Object> map) {
		return sqlSession.selectOne("Boards_Qna.boardWriter", map);
	}

	public int boardModify(Board_Qna modifyboard) {
		return sqlSession.update("Boards_Qna.modify", modifyboard);
	}

	public int boardDelete(Board_Qna board) {
		return sqlSession.delete("Boards_Qna.delete", board);
	}

	public int insert_deleteFile(String before_file) {
		return sqlSession.insert("Boards_Qna.insert_deleteFile", before_file);
	}

	public List<String> getDeleteFileList() {
		return sqlSession.selectList("Boards_Qna.deteFileList");
	}
}
