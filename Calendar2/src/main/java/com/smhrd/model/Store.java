package com.smhrd.model;

public class Store {
	private int USER_BNUM;
	private String STORE_NAME;
	private String STORE_ADDRESS;
	private String STORE_CONTACT;
	
public Store(int USER_BNUM, String STORE_NAME, String STORE_ADDRESS, String STORE_CONTACT) {
		this.USER_BNUM = USER_BNUM;
		this.STORE_NAME = STORE_NAME;
		this.STORE_ADDRESS = STORE_ADDRESS;
		this.STORE_CONTACT = STORE_CONTACT;
	}
	
	public Store( String STORE_NAME, String STORE_ADDRESS, String STORE_CONTACT) {
		
		this.STORE_NAME = STORE_NAME;
		this.STORE_ADDRESS = STORE_ADDRESS;
		this.STORE_CONTACT = STORE_CONTACT;
	}
	public Store(String STORE_NAME) {
		this.STORE_NAME = STORE_NAME;
	}
	public int getUSER_BNUM() {
		return USER_BNUM;
	}
	public void setUSER_BNUM(int uSER_BNUM) {
		USER_BNUM = uSER_BNUM;
	}
	public String getSTORE_NAME() {
		return STORE_NAME;
	}
	public void setSTORE_NAME(String sTORE_NAME) {
		STORE_NAME = sTORE_NAME;
	}
	public String getSTORE_ADDRESS() {
		return STORE_ADDRESS;
	}
	public void setSTORE_ADDRESS(String sTORE_ADDRESS) {
		STORE_ADDRESS = sTORE_ADDRESS;
	}
	public String getSTORE_CONTACT() {
		return STORE_CONTACT;
	}
	public void setSTORE_CONTACT(String sTORE_CONTACT) {
		STORE_CONTACT = sTORE_CONTACT;
	}
	
	

}
