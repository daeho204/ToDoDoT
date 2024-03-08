package com.smhrd.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SaveEventDataServlet")
public class SaveEventDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        reader.close();

        String json = sb.toString();

        // 여기에는 JSON 데이터를 파싱하고 DB에 저장하는 로직을 구현해야 합니다.
        // DB에 저장하는 부분은 JDBC 또는 JPA 등을 사용하여 구현할 수 있습니다.

        // 예시로서 JSON 데이터를 콘솔에 출력하는 부분을 추가합니다.
        System.out.println("Received JSON data:");
        System.out.println(json);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Data received and saved successfully!");
        out.close();
    }
}
