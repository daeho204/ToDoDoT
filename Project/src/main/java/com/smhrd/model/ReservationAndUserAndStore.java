package com.smhrd.model;

import java.math.BigDecimal;

public class ReservationAndUserAndStore extends ReservationVO {
	private String User_name;

	public String getUser_name() {
		return User_name;
	}

	public void setUser_name(String user_name) {
		User_name = user_name;
	}

	private String Store_name;
	
	public ReservationAndUserAndStore(String Store_id,  String User_id, String Menu_name, BigDecimal reserv_confirm) {
		super(Store_id, User_id, Menu_name, reserv_confirm);
	}
	
	public ReservationAndUserAndStore(String User_id, String Store_id, String Menu_name) {
		super(User_id, Store_id, Menu_name);

	}

	public ReservationAndUserAndStore(String User_id, String Store_id, String Menu_name, String User_name,
			String Store_name) {

		super(User_id, Store_id, Menu_name);
		this.User_name = User_name;
		this.Store_name = Store_name;
	}

	public ReservationAndUserAndStore(String Store_name, String Store_id, String User_id, String User_name, BigDecimal Reserv_confirm,
			String Menu_name) {

		super(Store_id, User_id, Menu_name, Reserv_confirm);
		this.User_name = User_name;
		this.Store_name = Store_name;

	}
	public ReservationAndUserAndStore(String User_name) {
		super();
		this.User_name = User_name;

	}
	public ReservationAndUserAndStore(BigDecimal reserv_confirm) {
		super(reserv_confirm);
	}

}
