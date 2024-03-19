package com.smhrd.model;
import java.math.BigDecimal;

import lombok.AllArgsConstructor;

import lombok.Data;
@AllArgsConstructor
@Data
public abstract class ReservationVO {
		
		protected BigDecimal Reserv_id;
		protected String Store_id;
		protected String User_id;
		protected String Store_name;
		protected String Reserv_date;
		protected String Reserv_start;
		protected String Reserv_end;
		protected String Menu_name;
		protected BigDecimal reserv_confirm;
		
		public ReservationVO(String User_id, String Store_id,  String Menu_name) {
			this.User_id = User_id;
			this.Store_id = Store_id;
			this.Menu_name = Menu_name;
		}
		public ReservationVO(String Store_id,  String User_id, String Menu_name, BigDecimal reserv_confirm) {
			this.Store_id = Store_id;
			this.User_id = User_id;
			this.Menu_name = Menu_name;
			this.reserv_confirm = reserv_confirm;
		}
		
		public ReservationVO(String User_id,  String Menu_name) {
			this.User_id = User_id;
			this.Menu_name = Menu_name;
		}
		public ReservationVO() {
		}
		public ReservationVO(BigDecimal reserv_confirm) {
			this.reserv_confirm = reserv_confirm;
		}
		
		
		
		
		
		
		
}


