package com.smhrd.model;


import lombok.AllArgsConstructor;
import lombok.Data;
@AllArgsConstructor
@Data
public class Store {
	private String Store_id;
	private int User_bnum;
	private String Store_name;
	private String Store_address;
	private String Store_contact;
	private String Store_descript;
	private String Store_img;

	public Store(String Store_id, String Store_name, String Store_address, String Store_contact, String 
			Store_descript, String Store_img) {
		this.Store_id = Store_id;
		this.Store_name = Store_name;
		this.Store_address = Store_address;
		this.Store_contact = Store_contact;
		this.Store_descript = Store_descript;
		this.Store_img = Store_img;

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

	public String getStore_id() {
		return Store_id;
	}

	public void setStore_id(String store_id) {
		Store_id = store_id;
	}

	public int getUser_bnum() {
		return User_bnum;
	}

	public void setUser_bnum(int user_bnum) {
		User_bnum = user_bnum;
	}

	public String getStore_name() {
		return Store_name;
	}

	public void setStore_name(String store_name) {
		Store_name = store_name;
	}

	public String getStore_address() {
		return Store_address;
	}

	public void setStore_address(String store_address) {
		Store_address = store_address;
	}

	public String getStore_contact() {
		return Store_contact;
	}

	public void setStore_contact(String store_contact) {
		Store_contact = store_contact;
	}

	public String getStore_descript() {
		return Store_descript;
	}

	public void setStore_descript(String store_descript) {
		Store_descript = store_descript;
	}

	public String getStore_img() {
		return Store_img;
	}

	public void setStore_img(String store_img) {
		Store_img = store_img;
	}

}
