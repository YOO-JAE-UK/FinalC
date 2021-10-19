package com.naver.myhome.domain;

public class MailVO2 {
	private String from="coffee_project@naver.com"; //인증받은 네이버 아이디 
	private String to;
	private String subject="Coffee Of Us 비밀번호 확인 메일입니다. ";
	private String content="비밀번호 확인 메일 발송되었습니다. 로그인 하세요. ";
	
	
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
