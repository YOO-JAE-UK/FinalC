package com.naver.myhome.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.MemberDAO;
import com.naver.myhome.domain.Email;
import com.naver.myhome.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;

	@Override
	public int isId(String id) {
		Member rmember = dao.isId(id);
		return (rmember==null) ? -1 : 1;  //-1은 아이디가 존재하지 않는 경우
		                                  //1은 아이디가 존재하는 경우
	}
	
	@Override
	public int isEmail(String email) {
		Member rmember = dao.isEmail(email);
		return (rmember==null) ? -1 : 1;  //-1은 이메일이 존재하지 않는 경우
										  //1은 이메일이 존재하는 경우
	}
	
	@Override
	public int isNickname(String nickname) {
		Member rmember = dao.isNickname(nickname);
		return (rmember==null) ? -1 : 1;  //-1은 닉네임이 존재하지 않는 경우
										  //1은 닉네임이 존재하는 경우
	}


	@Override
	public int insert(Member m) {
		return dao.insert(m);
	}

	
	@Override
	public int isId(String id, String password) {
		Member rmember = dao.isId(id);
		int result=-1; //아이디가 존재하지 않는 경우 - rmember가 null인 경우
		if(rmember!=null) {//아이디가 존재하는 경우
			if(rmember.getUSER_PASS().equals(password)) {
				result=1;  //아이디과 비밀번호가 일치하는 경우
			}else
				result=0;  //아이디는 존재하지만 비밀번호가 일치하지 않는 경우
		}
		return result;
	}
	
	// 아이디 찾기
	@Override
	public Member findId(String email){
		return dao.findId(email);
		
	}
	
	//비밀번호 찾기 이메일
	@Override
	public Member findpass_email(String id, String email) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return dao.findpass_email(map);
	}

	@Override
	public Member member_info(String id) {
		return dao.member_info(id);
	}

	@Override
	public void delete(String id) {
		 dao.delete(id);
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	@Override
	public List<Member> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(index!=-1) {
			String[] search_field = new String[] { "id", "name", "nickname"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start",  startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		if(index!=-1) {
			String[] search_field = new String[] { "id", "name", "nickname"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		return dao.getSearchListCount(map);
	}

	@Override
	public int email_insert(String id,String user_email, String key) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("user_email", user_email);
		map.put("key", key);
		map.put("id", id);
		return dao.insert_email(map);
	}

	@Override
	public Email emailverify(String email, String key) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);
		map.put("key", key);
		return dao.emailverify(map);
	}

	@Override
	public void updateKey(String email) {
		dao.updateKey(email);
		
	}

	@Override
	public int verifyKeyCheck(String id) {
		Email email=dao.verifyKeyCheck(id);
		return (email != null) ? 1 : 0;
	}

	
	//비밀번호 변경
	@Override
	public int changepass(String id, String newpass) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("newpass", newpass);
		return dao.changepass(map);
	}

	

	
	@Override
	public String Nickname(String id) {
		return dao.nickname(id);
	}






	
	
	

}
