/*210907.화 
 * 데이터베이스, 비지니스 객체, 뷰 객체에서 가져온 값을 저장하거나
 * 데이터베이스, 비지니스 객체, 뷰 객체에서 보낼 값을 저장하는 객체를
 * 도메인 객체(Domain Object)
 * 또는 도메인 모델(Domain Model)이라 한다.
 */
package com.naver.myhome.domain;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String USER_ID;
	private String USER_PASS;
	private String USER_NAME;
	private String USER_NICKNAME;
	private String USER_EMAIL;
	private String USER_ADDRESS_POST;
	private String USER_ADDRESS;
	private String USER_PHONE;
	private String USER_FILE=""; //파일이름
	private String USER_IMG="";  //실제저장될 파일이름 original
	private String USER_CHECK;
	private String USER_LASTLOGIN;
	
	//joinForm.jsp에서 프로필사진의 <input type="file" name="uploadfile" 확인하세요.
	private MultipartFile  uploadfile;		//db없음

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_PASS() {
		return USER_PASS;
	}

	public void setUSER_PASS(String uSER_PASS) {
		USER_PASS = uSER_PASS;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getUSER_NICKNAME() {
		return USER_NICKNAME;
	}

	public void setUSER_NICKNAME(String uSER_NICKNAME) {
		USER_NICKNAME = uSER_NICKNAME;
	}

	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}

	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}

	public String getUSER_ADDRESS_POST() {
		return USER_ADDRESS_POST;
	}

	public void setUSER_ADDRESS_POST(String uSER_ADDRESS_POST) {
		USER_ADDRESS_POST = uSER_ADDRESS_POST;
	}

	public String getUSER_ADDRESS() {
		return USER_ADDRESS;
	}

	public void setUSER_ADDRESS(String uSER_ADDRESS) {
		USER_ADDRESS = uSER_ADDRESS;
	}

	public String getUSER_PHONE() {
		return USER_PHONE;
	}

	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}

	public String getUSER_FILE() {
		return USER_FILE;
	}

	public void setUSER_FILE(String uSER_FILE) {
		USER_FILE = uSER_FILE;
	}

	public String getUSER_IMG() {
		return USER_IMG;
	}

	public void setUSER_IMG(String uSER_IMG) {
		USER_IMG = uSER_IMG;
	}

	public String getUSER_CHECK() {
		return USER_CHECK;
	}

	public void setUSER_CHECK(String uSER_CHECK) {
		USER_CHECK = uSER_CHECK;
	}

	public String getUSER_LASTLOGIN() {
		return USER_LASTLOGIN;
	}

	public void setUSER_LASTLOGIN(String uSER_LASTLOGIN) {
		USER_LASTLOGIN = uSER_LASTLOGIN;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}


	
	
	
	

}
