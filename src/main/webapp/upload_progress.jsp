<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // MySQL 데이터베이스 연결 정보
  String url = "jdbc:mysql://localhost:3306/triview";
  String username = "root";
  String password = "tpahfdl3310";

  // 폼에서 전송된 데이터를 받아옴
  String u_name = request.getParameter("u_name");
  String u_password = request.getParameter("u_password");
  String u_nationality = request.getParameter("u_nationality");
  String u_race = request.getParameter("u_race");
  String u_address = request.getParameter("u_address");
  
  // 프로필 사진은 파일 업로드를 처리해야 함
  Part profilePart = request.getPart("profile");
  // 프로필 사진을 저장할 경로 설정
  String profilePath = "/path/to/profiles/" + username + ".jpg";
  profilePart.write(profilePath);
  
  // MySQL 데이터베이스 연결
  Connection conn = null;
  PreparedStatement pstmt = null;
  
  try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    
    // 회원 정보 업데이트 쿼리 실행
    String query = "UPDATE user SET u_password=?, u_nationality=?, u_race=?, u_address=? WHERE u_name=?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, u_password);
    pstmt.setString(2, u_nationality);
    pstmt.setString(3, u_race);
    pstmt.setString(4, u_address);
    pstmt.setString(5, u_name);
    pstmt.executeUpdate();
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // 리소스 해제
    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
  
  // 업데이트 후에 회원 정보 수정 완료 페이지로 리다이렉트
  response.sendRedirect("mypage.jsp");
%>
