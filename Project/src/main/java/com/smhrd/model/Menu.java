package com.smhrd.model;


import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Menu {
	/* private String menu_id; */
	private String menu_id;
	private String menu_name;
	private String menu_descript;
	private int menu_price;
	private String menu_img;


	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_descript() {
		return menu_descript;
	}

	public void setMenu_descript(String menu_descript) {
		this.menu_descript = menu_descript;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}

	public Menu(String menu_name, String menu_descript, int menu_price, String menu_img) {
		this.menu_name = menu_name;
		this.menu_descript = menu_descript;
		this.menu_price = menu_price;
		this.menu_img = menu_img;
	}

}
