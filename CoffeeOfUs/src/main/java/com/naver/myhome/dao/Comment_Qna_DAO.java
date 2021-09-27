
package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Comment_Qna;

@Repository // 외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Comment_Qna_DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(int board_num) {
		return sqlSession.selectOne("Commentsqna.count", board_num);
	}

	public List<Comment_Qna> getCommentList(Map<String, Integer> map) {
		return sqlSession.selectList("Commentsqna.getList", map);
	}

	public int commentsInsert(Comment_Qna c) {
		return sqlSession.insert("Commentsqna.insert", c);
	}

	public int commentDelete(int num) {
		return sqlSession.delete("Commentsqna.delete", num);
	}

	public int commentUpdate(Comment_Qna co) {
		return sqlSession.update("Commentsqna.update", co);
	}
}
