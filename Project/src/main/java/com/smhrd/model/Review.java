package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Review {
	
	
	private String reserv_no;
	private int review_star;
	private String review_content;
	private String review_date;
	
	public Review(int review_star, String review_content) {
		this.review_star = review_star;
		this.review_content = review_content;
	}
}
