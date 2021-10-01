package com.naver.myhome.domain;

public class MailVO {
	private String from="2021234@naver.com"; //�������� ���̹� ���̵� 
	private String to;
	private String subject="ȸ�� ������ ���ϵ帳�ϴ�. - ����";
	private String content="ȸ�� ������ ���ϵ帳�ϴ�. - ����";
	
	
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
