package com.naver.myhome.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.AttendCheckMember;

@Repository
public class eventDAO {
   
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(String id) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attend_check.insert",id);
	}

	public List<AttendCheckMember> getList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("attend_check.attendList",id);
	}

	public AttendCheckMember isCheck( HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attend_check.isCheck",map);
	}

	public int attendCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attend_check.attendCount",map);
	}

	public int addPoint(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attend_check.addPoint",map);
	}
	
}
