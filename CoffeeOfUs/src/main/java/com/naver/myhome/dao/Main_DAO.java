package com.naver.myhome.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.CRAWLER;

@Repository //외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Main_DAO {
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public List<CRAWLER> getList() {
			return sqlSession.selectList("Main.list");
		}

		public int updateList(CRAWLER bean) {
			return sqlSession.update("Main.update",bean);
		}

		public CRAWLER getDetail(int num) {
			return sqlSession.selectOne("Main.detail",num);
		}
		
}
