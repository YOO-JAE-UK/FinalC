
package com.naver.myhome.domain;

import org.springframework.web.multipart.MultipartFile;

public class Board_Qna {
	private int QNA_NUM;
	private String QNA_PASS;
	private String QNA_SUBJECT;
	private String USER_ID;
	private String USER_NICKNAME;
	private String QNA_CONTENT;
	private int QNA_RE_REF;
	private int QNA_RE_LEV;
	private int QNA_RE_SEQ;
	private int QNA_READCOUNT;
	private String QNA_DATE;

	private MultipartFile uploadFile; // db없음 
	private String QNA_ORIGINAL; //파일이름
	private String QNA_FILE; // 실제저장될 파일이름

	private int CNT;

	public int getQNA_NUM() {
		return QNA_NUM;
	}

	public void setQNA_NUM(int qNA_NUM) {
		QNA_NUM = qNA_NUM;
	}

	public String getQNA_PASS() {
		return QNA_PASS;
	}

	public void setQNA_PASS(String qNA_PASS) {
		QNA_PASS = qNA_PASS;
	}

	public String getQNA_SUBJECT() {
		return QNA_SUBJECT;
	}

	public void setQNA_SUBJECT(String qNA_SUBJECT) {
		QNA_SUBJECT = qNA_SUBJECT;
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

	public String getQNA_CONTENT() {
		return QNA_CONTENT;
	}

	public void setQNA_CONTENT(String qNA_CONTENT) {
		QNA_CONTENT = qNA_CONTENT;
	}

	public int getQNA_RE_REF() {
		return QNA_RE_REF;
	}

	public void setQNA_RE_REF(int qNA_RE_REF) {
		QNA_RE_REF = qNA_RE_REF;
	}

	public int getQNA_RE_LEV() {
		return QNA_RE_LEV;
	}

	public void setQNA_RE_LEV(int qNA_RE_LEV) {
		QNA_RE_LEV = qNA_RE_LEV;
	}

	public int getQNA_RE_SEQ() {
		return QNA_RE_SEQ;
	}

	public void setQNA_RE_SEQ(int qNA_RE_SEQ) {
		QNA_RE_SEQ = qNA_RE_SEQ;
	}

	public int getQNA_READCOUNT() {
		return QNA_READCOUNT;
	}

	public void setQNA_READCOUNT(int qNA_READCOUNT) {
		QNA_READCOUNT = qNA_READCOUNT;
	}

	public String getQNA_DATE() {
		return QNA_DATE;
	}

	public void setQNA_DATE(String qNA_DATE) {
		QNA_DATE = qNA_DATE;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getQNA_ORIGINAL() {
		return QNA_ORIGINAL;
	}

	public void setQNA_ORIGINAL(String qNA_ORIGINAL) {
		QNA_ORIGINAL = qNA_ORIGINAL;
	}

	public String getQNA_FILE() {
		return QNA_FILE;
	}

	public void setQNA_FILE(String qNA_FILE) {
		QNA_FILE = qNA_FILE;
	}

	public int getCNT() {
		return CNT;
	}

	public void setCNT(int cNT) {
		CNT = cNT;
	}

}
