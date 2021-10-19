package com.naver.myhome.domain;

import org.springframework.web.multipart.MultipartFile;

public class Bean {
	private int BEAN_NUM;
	private String BEAN_NAME ;
	private String BEAN_CONTENT;
	private String BEAN_FILE;
	private String BEAN_ORIGINAL;
	private String BEAN_DATE;
	private float BEAN_ROASTING;
	private int BEAN_AROMA;
	private int BEAN_SOUR;
	private int BEAN_SWEET;
	private int BEAN_BALANCE; 
	private int BEAN_BODY;
	
	private MultipartFile  uploadfile;		//db없음
	
	
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getBEAN_NUM() {
		return BEAN_NUM;
	}
	public void setBEAN_NUM(int bEAN_NUM) {
		BEAN_NUM = bEAN_NUM;
	}
	public String getBEAN_NAME() {
		return BEAN_NAME;
	}
	public void setBEAN_NAME(String bEAN_NAME) {
		BEAN_NAME = bEAN_NAME;
	}
	public String getBEAN_CONTENT() {
		return BEAN_CONTENT;
	}
	public void setBEAN_CONTENT(String bEAN_CONTENT) {
		BEAN_CONTENT = bEAN_CONTENT;
	}
	public String getBEAN_FILE() {
		return BEAN_FILE;
	}
	public void setBEAN_FILE(String bEAN_FILE) {
		BEAN_FILE = bEAN_FILE;
	}
	public String getBEAN_ORIGINAL() {
		return BEAN_ORIGINAL;
	}
	public void setBEAN_ORIGINAL(String bEAN_ORIGINAL) {
		BEAN_ORIGINAL = bEAN_ORIGINAL;
	}
	public String getBEAN_DATE() {
		return BEAN_DATE;
	}
	public void setBEAN_DATE(String bEAN_DATE) {
		BEAN_DATE = bEAN_DATE;
	}
	
	public float getBEAN_ROASTING() {
		return BEAN_ROASTING;
	}
	public void setBEAN_ROASTING(float bEAN_ROASTING) {
		BEAN_ROASTING = bEAN_ROASTING;
	}
	public int getBEAN_AROMA() {
		return BEAN_AROMA;
	}
	public void setBEAN_AROMA(int bEAN_AROMA) {
		BEAN_AROMA = bEAN_AROMA;
	}
	public int getBEAN_SOUR() {
		return BEAN_SOUR;
	}
	public void setBEAN_SOUR(int bEAN_SOUR) {
		BEAN_SOUR = bEAN_SOUR;
	}
	public int getBEAN_SWEET() {
		return BEAN_SWEET;
	}
	public void setBEAN_SWEET(int bEAN_SWEET) {
		BEAN_SWEET = bEAN_SWEET;
	}
	public int getBEAN_BALANCE() {
		return BEAN_BALANCE;
	}
	public void setBEAN_BALANCE(int bEAN_BALANCE) {
		BEAN_BALANCE = bEAN_BALANCE;
	}
	public int getBEAN_BODY() {
		return BEAN_BODY;
	}
	public void setBEAN_BODY(int bEAN_BODY) {
		BEAN_BODY = bEAN_BODY;
	}
	
	
	
}
