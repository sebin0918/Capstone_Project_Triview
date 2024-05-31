<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
   // 데이터베이스 연결 정보 설정
   String url = "jdbc:mysql://localhost:3306/triview";
   String username = "root";
   String password = "1234";

   // 데이터베이스 연결
   Connection connection = null;
   Statement statement = null;
   ResultSet resultSet = null;
   try {
       Class.forName("com.mysql.jdbc.Driver");
       connection = DriverManager.getConnection(url, username, password);
       statement = connection.createStatement();
   } catch (Exception e) {
       e.printStackTrace();
   }

   // 사용자 정보 저장
   String photo = request.getParameter("u_photo");
   String name = request.getParameter("u_name");
   String email = request.getParameter("u_address");
   //String phone = request.getParameter("u_phone");

   String insertUserQuery = "INSERT INTO users (u_photo, u_name, u_address) VALUES ('" + photo + "', '" + name + "', '" + email + "')";
   statement.executeUpdate(insertUserQuery);

   // 영수증 정보 저장
   String restaurantType = request.getParameter("restaurantType");
   int count = Integer.parseInt(request.getParameter("count"));
   String insertReceiptQuery = "INSERT INTO receipts (user_id, restaurant_type, count) VALUES ((SELECT id FROM users WHERE email='" + email + "'), '" + restaurantType + "', " + count + ")";
   statement.executeUpdate(insertReceiptQuery);

   // 후기글 저장
   String review = request.getParameter("review");
   String insertReviewQuery = "INSERT INTO reviews (user_id, review) VALUES ((SELECT id FROM users WHERE email='" + email + "'), '" + review + "')";
   statement.executeUpdate(insertReviewQuery);

   // 마이페이지 정보 조회
   String selectUserQuery = "SELECT * FROM user WHERE email='" + email + "'";
   resultSet = statement.executeQuery(selectUserQuery);

   // 사용자 정보 출력
   if (resultSet.next()) {
       out.println("사용자 정보:<br>");
       out.println("사진: " + resultSet.getString("u_photo") + "<br>");
       out.println("이름: " + resultSet.getString("u_name") + "<br>");
       out.println("이메일: " + resultSet.getString("u_email") + "<br>");
       out.println("휴대전화: " + resultSet.getString("u_phone") + "<br>");
   }

   // 영수증 정보 조회
   String selectReceiptQuery = "SELECT * FROM receipts WHERE user_id=(SELECT id FROM users WHERE email='" + email + "')";
   resultSet = statement.executeQuery(selectReceiptQuery);

   // 영수증 정보 출력
   out.println("<br>영수증 정보:<br>");
   while (resultSet.next()) {
       out.println("음식점 종류: " + resultSet.getString("u_restaurant_type") + "<br>");
       out.println("횟수: " + resultSet.getInt("count") + "<br>");
   }

   // 후기글 정보 조회
   String selectReviewQuery = "SELECT * FROM reviews WHERE user_id=(SELECT id FROM users WHERE email='" + email + "')";
   resultSet = statement.executeQuery(selectReviewQuery);

   // 후기글 정보 출력
   out.println("<br>후기글:<br>");
   while (resultSet.next()) {
       out.println(resultSet.getString("review") + "<br>");
   }

   // 데이터베이스 연결 해제
   if (resultSet != null) resultSet.close();
   if (statement != null) statement.close();
   if (connection != null) connection.close();
%>
