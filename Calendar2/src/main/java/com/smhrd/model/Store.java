package com.smhrd.model;

import java.math.BigDecimal;

public class Store {
	private int Store_id;
	private int User_bnum;
	private String Store_name;
	private String Store_address;
	private String Store_contact;
	private String Store_descript;
	private String Store_img;

	

	public Store(int User_bnum, String Store_name, String Store_address, String Store_contact,
			String Store_img) {
		this.User_bnum = User_bnum;
		this.Store_name = Store_name;
		this.Store_address = Store_address;
		this.Store_contact = Store_contact;
		this.Store_img = Store_img;
	}
	public Store(int Store_id, String Store_name, String Store_address, String Store_contact) {
		this.Store_id = Store_id;
		this.Store_name = Store_name;
		this.Store_address = Store_address;
		this.Store_contact = Store_contact;
		
	}

	public Store(String Store_name, String Store_address, String Store_contact, String Store_img) {

		this.Store_name = Store_name;
		this.Store_address = Store_address;
		this.Store_contact = Store_contact;
		this.Store_img = Store_img;

	}
	public Store(String Store_name, String Store_address, String Store_contact) {

		this.Store_name = Store_name;
		this.Store_address = Store_address;
		this.Store_contact = Store_contact;
		

	}
	
	public Store(String Store_img) {
		
		this.Store_img = Store_img;

	}
	
	public int getStore_id() {
		return Store_id;
	}

	

	public int getUser_bnum() {
		return User_bnum;
	}

	public void setUser_bnum(BigDecimal User_bnum) {
		User_bnum = User_bnum;
	}

	public String getStore_name() {
		return Store_name;
	}

	public void setStore_name(String Store_name) {
		Store_name = Store_name;
	}

	public String getStore_address() {
		return Store_address;
	}

	public void setStore_address(String Store_address) {
		Store_address = Store_address;
	}

	public String getStore_contact() {
		return Store_contact;
	}

	public void setStore_contact(String Store_contact) {
		Store_contact = Store_contact;
	}
	
	public String getStore_img() {
		return Store_img;
	}

	public void setStore_img(String store_img) {
		Store_img = store_img;
	}
	
	public String getStore_descript() {
		return Store_descript;
	}

	public void setStore_descript(String store_descript) {
		Store_descript = store_descript;
	}

}
