<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="u_name" />
<jsp:setProperty name="user" property="u_id" />
<jsp:setProperty name="user" property="u_password" />
<jsp:setProperty name="user" property="u_nationality" />
<jsp:setProperty name="user" property="u_race" />
<jsp:setProperty name="user" property="u_address" />
<jsp:setProperty name="user" property="u_addressstart" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<%
	
    // 입력값 검증
    if(user.getU_name() == null || user.getU_id() == null || user.getU_password() == null 
    || user.getU_nationality() == null || user.getU_race() == null || user.getU_address() == null || user.getU_addressstart() == null)
    {
    	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
        return;
    }
    else {
    	UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if (result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'place.jsp'");
			script.println("</script>");
		}
    }
    /*if(!u_password.equals(password_confirm)) {
        out.println("비밀번호가 일치하지 않습니다.");
        return;
    }*/
    
   
%>
</body>
</html>
