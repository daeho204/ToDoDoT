package com.smhrd.model;
import java.math.BigDecimal;

import lombok.AllArgsConstructor;

import lombok.Data;
@AllArgsConstructor
@Data
public class ReservationVO {
		
		private int Reserv_id;
		private String Store_id;
		private String User_id;
		private String Store_name;
		private String Reserv_date;
		private String Reserv_start;
		private String Reserv_end;
		private String Menu_name;
		private int reserv_confirm;
		
		public ReservationVO(String User_id, String Store_id,  String Menu_name) {
			this.User_id = User_id;
			this.Store_id = Store_id;
			this.Menu_name = Menu_name;
		}
		
		public ReservationVO(String User_id,  String Menu_name) {
			this.User_id = User_id;
			this.Menu_name = Menu_name;
		}
		
		
		
}


