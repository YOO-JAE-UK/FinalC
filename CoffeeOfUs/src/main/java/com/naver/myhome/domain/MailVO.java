package com.naver.myhome.domain;

public class MailVO {
	private String from="coffee_project@naver.com"; //인증받은 네이버 아이디 
	private String to;
	private String subject="Coffee Of Us 회원가입 인증 메일입니다. ";
	private String content="새로운 비밀번호로 로그인하세요 ";
	
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
