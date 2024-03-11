package com.smhrd.model;

public class CalendarEvent {
	
	    private int calendarId;
	    private String title;
	    private String startDate;
	    private String endDate;
	    
	 // Getter 및 Setter 메서드
	    
	    public CalendarEvent(int calendarID, String title, String startDate, String endDate) {
	    	this.calendarId = calendarID;
	    	this.title = title;
	    	this.startDate = startDate;
	    	this.endDate = endDate;
	    }
		public int getCalendarId() {
			return calendarId;
		}
		public void setCalendarId(int calendarId) {
			this.calendarId = calendarId;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStartDate() {
			return startDate;
		}
		public void setStartDate(String startDate) {
			this.startDate = startDate;
		}
		public String getEndDate() {
			return endDate;
		}
		public void setEndDate(String endDate) {
			this.endDate = endDate;
		}

	    

}
