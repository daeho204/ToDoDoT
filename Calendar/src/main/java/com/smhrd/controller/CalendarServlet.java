package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.model.Event;

@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청에서 전송된 JSON 데이터를 읽어옵니다.
        ObjectMapper mapper = new ObjectMapper();
        List<Event> events = mapper.readValue(request.getInputStream(), mapper.getTypeFactory().constructCollectionType(List.class, Event.class));
        
        // 데이터베이스에 연결하고 이벤트를 저장합니다.
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // 데이터베이스 연결 정보 설정
            String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
            String username = "seocho_21K_bigdata_p2_1";
            String password = "smhrd1";
            
            // 데이터베이스 연결
            conn = DriverManager.getConnection(url, username, password);
            
            // SQL 쿼리 작성
            String sql = "INSERT INTO events (title, start, end, color) VALUES (?, ?, ?, ?)";
            
            // Prepared Statement 설정
            stmt = conn.prepareStatement(sql);
            
            // 이벤트를 데이터베이스에 저장
            for (Event event : events) {
                stmt.setString(1, event.getTitle());
                stmt.setString(2, event.getStart());
                stmt.setString(3, event.getEnd());
                stmt.setString(4, event.getColor());
                stmt.addBatch(); // 배치에 추가
            }
            
            // 배치 실행
            stmt.executeBatch();
            
            // 성공 응답 전송
            response.setStatus(HttpServletResponse.SC_OK);
            PrintWriter out = response.getWriter();
            out.print("Events saved successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            // 실패 응답 전송
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("Error occurred while saving events.");
        } finally {
            // 리소스 해제
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
