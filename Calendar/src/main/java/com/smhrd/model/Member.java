package com.smhrd.model;

import lombok.Data;

@Data
public class Member {

	private String id;
	private String pw;
	private String tel;
	private String address;
	
	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public Member(String pw, String tel, String address) {
		this.pw = pw;
		this.tel = tel;
		this.address = address;
	}
	
	public Member(String id, String pw, String tel, String address) {
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getTel() {
		return tel;
	}

	public String getAddress() {
		return address;
	}
	


	
	
}


