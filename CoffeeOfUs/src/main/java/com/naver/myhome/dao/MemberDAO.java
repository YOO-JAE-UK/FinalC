package com.naver.myhome.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Email;
import com.naver.myhome.domain.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member isId(String id) {
		                            //member.xml의 네임스페이스 Members 에서 id 값이 idcheck를 쓰고, id정보를 거기로 보낸다  
		return sqlSession.selectOne("Members.idcheck", id);//member.xml주소
	}
	
	public Member isEmail(String email) {
									//member.xml의 네임스페이스 Members 에서 id 값이 emailcheck를 쓰고, email정보를 거기로 보낸다  
		return sqlSession.selectOne("Members.emailcheck", email);//member.xml주소
	}
	
	public Member isNickname(String nickname) {
		//member.xml의 네임스페이스 Members 에서 id 값이 nicknamecheck를 쓰고, nickname정보를 거기로 보낸다  
		return sqlSession.selectOne("Members.nicknamecheck", nickname);//member.xml주소
	}
	
	public int insert(Member m) {
		return sqlSession.insert("Members.insert", m);
	}


	public Member member_info(String id) {
		return sqlSession.selectOne("Members.idcheck", id); //member.xml주소
	}
	
	public int update(Member m) {
		return sqlSession.update("Members.update", m);
	}

	public void delete(String id) {
		 sqlSession.delete("Members.delete", id);
	}

	public int getSearchListCount(Map<String, String> map) {
		return sqlSession.selectOne("Members.searchCount", map);
	}
	
	public List<Member> getSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Members.getSearchList", map);
	}

	public int insert_email(Map<String, Object> map) {
		return sqlSession.insert("Email.emailinsert", map);
	}

	public Email emailverify(Map<String, Object> map) {
		return sqlSession.selectOne("Email.emailverify",map);
	}

	public void updateKey(String email) {
		 sqlSession.update("Email.updateKey",email);
	}

	public Email verifyKeyCheck(String id) {
		return sqlSession.selectOne("Email.verifyKeyCheck",id);
	}
	
	
	

}
