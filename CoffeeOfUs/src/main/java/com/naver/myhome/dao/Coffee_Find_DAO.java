package com.naver.myhome.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Bean;
import com.naver.myhome.domain.Coffee;


@Repository //외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Coffee_Find_DAO {
		@Autowired
		private SqlSessionTemplate sqlSession;

		public List<Coffee> getList() {
			return sqlSession.selectList("Coffees.word_list");
			
		}

		public String getContent(String word) {
			return sqlSession.selectOne("Coffees.word_content",word);
		}

		public int add_word(Coffee coffee) {
			return sqlSession.insert("Coffees.add_word",coffee);
		}




		
}
