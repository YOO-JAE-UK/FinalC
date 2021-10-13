package com.naver.myhome.domain;



public class Board_Event {
	
	private String id;
	
	private String reg_date;
	private String content;
	private int event_board_num;
	private int event_re_ref;
	private int event_re_lev;
	private int event_re_seq;
	private String user_file;
	
	
	
	public String getUser_file() {
		return user_file;
	}
	public void setUser_file(String user_file) {
		this.user_file = user_file;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEvent_board_num() {
		return event_board_num;
	}
	public void setEvent_board_num(int event_board_num) {
		this.event_board_num = event_board_num;
	}
	public int getEvent_re_ref() {
		return event_re_ref;
	}
	public void setEvent_re_ref(int event_re_ref) {
		this.event_re_ref = event_re_ref;
	}
	public int getEvent_re_lev() {
		return event_re_lev;
	}
	public void setEvent_re_lev(int event_re_lev) {
		this.event_re_lev = event_re_lev;
	}
	public int getEvent_re_seq() {
		return event_re_seq;
	}
	public void setEvent_re_seq(int event_re_seq) {
		this.event_re_seq = event_re_seq;
	}
	
	
	
	
	
}
