package com.naver.myhome.dao;




import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Bean;

@Repository //외부I/O 처리 : @Repository (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class Coffee_Bean_DAO {
		@Autowired
		private SqlSessionTemplate sqlSession;

		public void bean_add(Bean bean) {
			sqlSession.insert("Beans.bean_add",bean);
		}

		public int getListCount(String search_text) {
			return sqlSession.selectOne("Beans.count",search_text);
		}

		public List<Bean> getList(HashMap<String, Object> map) {
			return sqlSession.selectList("Beans.getlist",map);
		}

		public Bean getDetail(int num) {
			return sqlSession.selectOne("Beans.bean_detail",num);
		}

		public Bean getTest_Detail(HashMap<String, Object> map) {
			return sqlSession.selectOne("Beans.test_detail",map);
		}

		public int boardModify(Bean modifyboard) {
			return sqlSession.update("Beans.modify",modifyboard);
		}

		public int insert_deleteFile(String before_file) {
			return sqlSession.insert("Beans.insert_deleteFile",before_file);
		}

		



		
}
