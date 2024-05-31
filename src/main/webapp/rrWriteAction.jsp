<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review_restaurant.Review_restaurantDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="review_restaurant" class="review_restaurant.Review_restaurant" scope="page" />
<jsp:setProperty name="review_restaurant" property="rp_comment" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>음식점 후기 작성 기능</title>
</head>
<body> 
	<%
		String u_id = null;
		if(session.getAttribute("u_id") != null)
		{
			u_id = (String) session.getAttribute("u_id");
		}
		if(u_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}	
		else
		{
			if(review_restaurant.getRp_comment() == null)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('후기를 작성해주세요!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else
			{
				Review_restaurantDAO review_restaurantDAO = new Review_restaurantDAO();
				int result = review_restaurantDAO.write(
					    review_restaurant.getRr_username(),
					    review_restaurant.getRp_nationality(),
					    Integer.toString(review_restaurant.getRp_agerange()),
					    review_restaurant.getRp_comment(),
					    review_restaurant.getRp_receipt()
					);
				if (result == -1)
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다..')");
					script.println("history.back()");
					script.println("</script>");
				}
				else
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'review_restaurant.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>