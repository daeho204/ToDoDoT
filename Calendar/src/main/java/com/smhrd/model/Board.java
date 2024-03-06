package com.smhrd.model;

import java.math.BigDecimal;

public class Board {
	private BigDecimal idx;
	private String title;
	private String content;
	private String writer;
	private String img;
	private String indate;
	
	
	public Board(BigDecimal idx, String title, String content, String writer, String img, String indate) {
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.img = img;
		this.indate = indate;
	}
	public Board(String title, String content, String writer, String img) {
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.img = img;
		
	}
	public void setImg(String img) {
	      this.img = img;
	   }
	   
	public BigDecimal getIdx() {
		return idx;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getWriter() {
		return writer;
	}
	public String getImg() {
		return img;
	}
	public String getIndate() {
		return indate;
	}
}

