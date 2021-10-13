package com.naver.myhome.service;

import java.util.List;
import java.util.Map;

import com.naver.myhome.domain.Email;
import com.naver.myhome.domain.Member;

public interface MemberService {
	public int isId(String id, String pass); // 로그인 처리
	
	public int insert(Member m); //회원가입 정보 삽입
	
	public int isId(String id);  //아이디 중복 확인
	
	public int isEmail(String email);  //이메일 중복 확인
	
	public int isNickname(String nickname);  //닉네임 중복 확인
	
	public Member member_info(String id); //개인정보
	
	public void delete(String id);  //회원 탈퇴 
	
	public int update(Member m); // 회원정보 수정
	
	public String passcheck(Member m); //비밀번호 확인 
	
	public int changepass(String id,String newpass); //비밀번호 변경
	
	public List<Member> getSearchList(int index, String search_word,
			                         int page, int limit);
	
	public int getSearchListCount(int index, String search_word);

	public int email_insert(String id,String user_EMAIL, String key);

	public Email emailverify(String email, String key);

	public void updateKey(String email);

	public int verifyKeyCheck(String id);

    
	

}
