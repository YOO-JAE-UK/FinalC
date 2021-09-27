package com.naver.myhome.domain;

import org.springframework.web.multipart.MultipartFile;

public class Board_Coffee {
	private int COFFEE_NUM;
	private String COFFEE_PASS;
	private String COFFEE_SUBJECT;
	private String USER_ID;
	private String USER_NICKNAME;
	private String COFFEE_DATE;
	private int COFFEE_READCOUNT;
	private String COFFEE_CONTENT;
	private int COFFEE_RE_REF;
	private int COFFEE_RE_LEV;
	private int COFFEE_RE_SEQ;
	
	
	private MultipartFile  uploadfile;		//db없음
	private String COFFEE_ORIGINAL;			//파일이름
	private String COFFEE_FILE;				//실제저장될 파일이름
	
	private int CNT;

	public int getCOFFEE_NUM() {
		return COFFEE_NUM;
	}

	public void setCOFFEE_NUM(int cOFFEE_NUM) {
		COFFEE_NUM = cOFFEE_NUM;
	}

	public String getCOFFEE_PASS() {
		return COFFEE_PASS;
	}

	public void setCOFFEE_PASS(String cOFFEE_PASS) {
		COFFEE_PASS = cOFFEE_PASS;
	}

	public String getCOFFEE_SUBJECT() {
		return COFFEE_SUBJECT;
	}

	public void setCOFFEE_SUBJECT(String cOFFEE_SUBJECT) {
		COFFEE_SUBJECT = cOFFEE_SUBJECT;
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

	public String getCOFFEE_DATE() {
		return COFFEE_DATE;
	}

	public void setCOFFEE_DATE(String cOFFEE_DATE) {
		COFFEE_DATE = cOFFEE_DATE;
	}

	public int getCOFFEE_READCOUNT() {
		return COFFEE_READCOUNT;
	}

	public void setCOFFEE_READCOUNT(int cOFFEE_READCOUNT) {
		COFFEE_READCOUNT = cOFFEE_READCOUNT;
	}

	public String getCOFFEE_CONTENT() {
		return COFFEE_CONTENT;
	}

	public void setCOFFEE_CONTENT(String cOFFEE_CONTENT) {
		COFFEE_CONTENT = cOFFEE_CONTENT;
	}

	public int getCOFFEE_RE_REF() {
		return COFFEE_RE_REF;
	}

	public void setCOFFEE_RE_REF(int cOFFEE_RE_REF) {
		COFFEE_RE_REF = cOFFEE_RE_REF;
	}

	public int getCOFFEE_RE_LEV() {
		return COFFEE_RE_LEV;
	}

	public void setCOFFEE_RE_LEV(int cOFFEE_RE_LEV) {
		COFFEE_RE_LEV = cOFFEE_RE_LEV;
	}

	public int getCOFFEE_RE_SEQ() {
		return COFFEE_RE_SEQ;
	}

	public void setCOFFEE_RE_SEQ(int cOFFEE_RE_SEQ) {
		COFFEE_RE_SEQ = cOFFEE_RE_SEQ;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getCOFFEE_ORIGINAL() {
		return COFFEE_ORIGINAL;
	}

	public void setCOFFEE_ORIGINAL(String cOFFEE_ORIGINAL) {
		COFFEE_ORIGINAL = cOFFEE_ORIGINAL;
	}

	public String getCOFFEE_FILE() {
		return COFFEE_FILE;
	}

	public void setCOFFEE_FILE(String cOFFEE_FILE) {
		COFFEE_FILE = cOFFEE_FILE;
	}

	public int getCNT() {
		return CNT;
	}

	public void setCNT(int cNT) {
		CNT = cNT;
	}

	
	
}
