package com.naver.myhome.domain;

public class Cart {
	private String id;
	private int ccode;
	private String cproductname;
	private String cdescription;
	private int cquantity;
	private int cperpoint;
	private int ctotalpoint;
	private String cimg;
	private int cremain;
	
	
	
	public int getCremain() {
		return cremain;
	}
	public void setCremain(int cremain) {
		this.cremain = cremain;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCproductname() {
		return cproductname;
	}
	public void setCproductname(String cproductname) {
		this.cproductname = cproductname;
	}
	public String getCdescription() {
		return cdescription;
	}
	public void setCdescription(String cdescription) {
		this.cdescription = cdescription;
	}
	public int getCquantity() {
		return cquantity;
	}
	public void setCquantity(int cquantity) {
		this.cquantity = cquantity;
	}
	public int getCperpoint() {
		return cperpoint;
	}
	public void setCperpoint(int cperpoint) {
		this.cperpoint = cperpoint;
	}
	public int getCtotalpoint() {
		return ctotalpoint;
	}
	public void setCtotalpoint(int ctotalpoint) {
		this.ctotalpoint = ctotalpoint;
	}
	public String getCimg() {
		return cimg;
	}
	public void setCimg(String cimg) {
		this.cimg = cimg;
	}
	
	
}
