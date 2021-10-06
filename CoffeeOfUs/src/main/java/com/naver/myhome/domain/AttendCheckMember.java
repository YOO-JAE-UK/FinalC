package com.naver.myhome.domain;

public class AttendCheckMember {
	private String id;
	private String attenddate;
	private String status;
	private int   point;
	
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAttenddate() {
		return attenddate;
	}
	public void setAttenddate(String attenddate) {
		this.attenddate = attenddate;
	}
	
	 
}
