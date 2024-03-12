package com.smhrd.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Menu {
	private BigDecimal idx;
	/* private String menu_id; */
	private String menu_id;
	private String menu_name;
	private String menu_descript;
	private String menu_price;
	private String menu_img;
	

	
	  public Menu(String menu_name, String menu_descript, String menu_price, String
	  menu_img) { this.menu_name=menu_name; this.menu_descript=menu_descript;
	  this.menu_price=menu_price; this.menu_img=menu_img; }
	 
}
