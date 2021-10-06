package com.naver.myhome.domain;

import org.springframework.web.multipart.MultipartFile;

public class Board_Tour {
	private int TOUR_NUM;
	private String USER_ID;
	private String USER_NICKNAME;
	private String TOUR_ADDRESS;
	private String TOUR_NAME;
	private String TOUR_SUBJECT;
	private String TOUR_CONTENT;
	private String TOUR_LATNG;
	private String TOUR_FILE;		//파일이름
	private String TOUR_ORIGINAL;	// 실제저장될 파일이름
	private String TOUR_DATE;
	
	private float	TOUR_GRADE;
	private int		TOUR_TASTE;
	private int		TOUR_ATMOSPHERE;
	private int	TOUR_SERVICE;
	private int	TOUR_READCOUNT;
	private int	TOUR_ADMIN;

	private MultipartFile  uploadfile;		//db없음

	public int getTOUR_NUM() {
		return TOUR_NUM;
	}

	public void setTOUR_NUM(int tOUR_NUM) {
		TOUR_NUM = tOUR_NUM;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_NICKNAME() {
		return USER_NICKNAME;
	}

	public void setUSER_NICKNAME(String uSER_NICKNAME) {
		USER_NICKNAME = uSER_NICKNAME;
	}

	public String getTOUR_ADDRESS() {
		return TOUR_ADDRESS;
	}

	public void setTOUR_ADDRESS(String tOUR_ADDRESS) {
		TOUR_ADDRESS = tOUR_ADDRESS;
	}

	public String getTOUR_NAME() {
		return TOUR_NAME;
	}

	public void setTOUR_NAME(String tOUR_NAME) {
		TOUR_NAME = tOUR_NAME;
	}

	public String getTOUR_SUBJECT() {
		return TOUR_SUBJECT;
	}

	public void setTOUR_SUBJECT(String tOUR_SUBJECT) {
		TOUR_SUBJECT = tOUR_SUBJECT;
	}

	public String getTOUR_CONTENT() {
		return TOUR_CONTENT;
	}

	public void setTOUR_CONTENT(String tOUR_CONTENT) {
		TOUR_CONTENT = tOUR_CONTENT;
	}

	public String getTOUR_LATNG() {
		return TOUR_LATNG;
	}

	public void setTOUR_LATNG(String tOUR_LATNG) {
		TOUR_LATNG = tOUR_LATNG;
	}

	public String getTOUR_FILE() {
		return TOUR_FILE;
	}

	public void setTOUR_FILE(String tOUR_FILE) {
		TOUR_FILE = tOUR_FILE;
	}

	public String getTOUR_ORIGINAL() {
		return TOUR_ORIGINAL;
	}

	public void setTOUR_ORIGINAL(String tOUR_ORIGINAL) {
		TOUR_ORIGINAL = tOUR_ORIGINAL;
	}

	public String getTOUR_DATE() {
		return TOUR_DATE;
	}

	public void setTOUR_DATE(String tOUR_DATE) {
		TOUR_DATE = tOUR_DATE;
	}

	public float getTOUR_GRADE() {
		return TOUR_GRADE;
	}

	public void setTOUR_GRADE(float tOUR_GRADE) {
		TOUR_GRADE = tOUR_GRADE;
	}

	public int getTOUR_TASTE() {
		return TOUR_TASTE;
	}

	public void setTOUR_TASTE(int tOUR_TASTE) {
		TOUR_TASTE = tOUR_TASTE;
	}

	public int getTOUR_ATMOSPHERE() {
		return TOUR_ATMOSPHERE;
	}

	public void setTOUR_ATMOSPHERE(int tOUR_ATMOSPHERE) {
		TOUR_ATMOSPHERE = tOUR_ATMOSPHERE;
	}

	public int getTOUR_SERVICE() {
		return TOUR_SERVICE;
	}

	public void setTOUR_SERVICE(int tOUR_SERVICE) {
		TOUR_SERVICE = tOUR_SERVICE;
	}

	public int getTOUR_READCOUNT() {
		return TOUR_READCOUNT;
	}

	public void setTOUR_READCOUNT(int tOUR_READCOUNT) {
		TOUR_READCOUNT = tOUR_READCOUNT;
	}

	public int getTOUR_ADMIN() {
		return TOUR_ADMIN;
	}

	public void setTOUR_ADMIN(int tOUR_ADMIN) {
		TOUR_ADMIN = tOUR_ADMIN;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	
	
}
