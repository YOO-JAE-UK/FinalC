package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Comment_Coffee;

@Repository //외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Comment_Coffee_DAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(int board_num) {
		return sqlSession.selectOne("Comments.count",board_num);
	}

	public List<Comment_Coffee> getCommentList(Map<String, Integer> map) {
		return sqlSession.selectList("Comments.getList", map);
	}
	
	public int commentsInsert(Comment_Coffee c) {
		return sqlSession.insert("Comments.insert",c);
	}
	
	public int commentDelete(int num) {
		return sqlSession.delete("Comments.delete",num);
	}

	public int commentUpdate(Comment_Coffee co) {
		return sqlSession.update("Comments.update",co);
	}
}
