package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
// VO
// Value Object
// 값을 가지는 객체. 회원정보를 가지는 객체
// 매개인자로 값을 입력하면 자신의 필드(저장공간)에 저장한다.

// 값을 보내거나 값을 가져올때 쓰는 일종의 택배 상자와 같다.
// Member 클래스는 Member객체의 설계도
// 혹은 객체의 타입
public class Member {
	private String id;
	private String pw;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String isbusiness;
	private String bnum;

	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	public Member(String pw, String phone, String address) {
		this.pw = pw;
		this.phone = phone;
		this.address = address;
	}
	public Member(String name, String pw, String phone, String address, String email) {
		this.name = name;
		this.pw = pw;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}
	public Member(String id, String name, String pw, String phone, String address, String email) {
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}
	
}


