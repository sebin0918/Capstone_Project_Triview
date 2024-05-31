<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="u_id" />
<jsp:setProperty name="user" property="u_password" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
    String u_id = request.getParameter("u_id");
    String u_password = request.getParameter("u_password");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.jdbc.Driver");
        // 데이터베이스 연결
        String jdbcUrl = "jdbc:mysql://localhost:3306/triview";
        String dbId = "root";
        String dbPass = "tpahfdl3310";
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
        // SELECT 쿼리문 실행
        String sql = "SELECT * FROM user WHERE u_id=? AND u_password=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, u_id);
        pstmt.setString(2, u_password);
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
            out.println(rs.getString("u_id") + "님, 로그인에 성공했습니다.");
        } else {
            out.println("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
    } catch(SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("로그인에 실패했습니다.");
    } finally {
        if(rs != null) try { rs.close(); } catch(SQLException e) {}
        if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
        if(conn != null) try { conn.close(); } catch(SQLException e) {}
    }
%>
</body>
</html>