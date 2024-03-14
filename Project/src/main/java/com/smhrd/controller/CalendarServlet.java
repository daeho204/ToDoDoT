package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.model.CalendarDAO;
import com.smhrd.model.CalendarEvent;

@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}
		String json = sb.toString();

		// JSON 데이터를 Java 객체로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		CalendarEvent calendarEvent = objectMapper.readValue(json, CalendarEvent.class);

		// MyBatis를 사용하여 데이터베이스에 저장
		CalendarDAO calendarDAO = new CalendarDAO();
		calendarDAO.insertCalendarEvent(calendarEvent);
		
		  // 받아온 데이터 확인
        System.out.println("Received calendar event:");
        System.out.println("Id: " + calendarEvent.getCalendarId());
        System.out.println("Title: " + calendarEvent.getTitle());
        System.out.println("Start: " + calendarEvent.getStartDate());
        System.out.println("End: " + calendarEvent.getEndDate());

		// 성공적으로 저장되었음을 클라이언트에 응답
		response.getWriter().println("Calendar event saved successfully.");
	}
}
