<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  // MySQL 데이터베이스 연결 정보
  String url = "jdbc:mysql://localhost:3306/triview";
  String username = "root";
  String password = "tpahfdl3310";

  // 폼에서 전송된 데이터를 받아옴
  String userName = request.getParameter("u_name");
  String passWord = request.getParameter("u_password");

  // MySQL 데이터베이스 연결
  Connection conn = null;
  PreparedStatement pstmt = null;
  
  try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    
    // 회원 탈퇴 쿼리 실행
    String query = "DELETE FROM users WHERE username=? AND password=?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, userName);
    pstmt.setString(2, passWord);
    int rowsAffected = pstmt.executeUpdate();
    
    if (rowsAffected > 0) {
      // 회원 탈퇴 성공
      out.println("회원 탈퇴가 완료되었습니다.");
    } else {
      // 회원 탈퇴 실패
      out.println("회원 탈퇴에 실패하였습니다. 입력된 정보를 확인해주세요.");
    }
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
%>
