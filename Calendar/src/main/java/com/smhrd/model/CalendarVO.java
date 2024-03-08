package com.smhrd.model;

public class CalendarVO {
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
    private boolean allday;
    /*set/get메서드*/
	public int getId() {
		return id;
	}
	public String getGroupId() {
		return groupId;
	}
	public String getTitle() {
		return title;
	}
	public String getWriter() {
		return writer;
	}
	public String getContent() {
		return content;
	}
	public String getStart() {
		return start;
	}
	public String getEnd() {
		return end;
	}
	public boolean isAllday() {
		return allday;
	}
    
    
    }

