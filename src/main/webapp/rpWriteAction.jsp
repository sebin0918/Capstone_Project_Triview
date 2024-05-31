<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review_place.Review_placeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="review_place" class="review_place.Review_place" scope="page" />
<jsp:setProperty name="review_place" property="rp_comment" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Place Review Write Action</title>
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
			if(review_place.getRp_comment() == null)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('후기를 작성해주세요!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else
			{
				Review_placeDAO review_placeDAO = new Review_placeDAO();
				int result = review_placeDAO.write(
					    review_place.getRp_username(),
					    review_place.getRp_nationality(),
					    
					    review_place.getRp_comment(),
					    review_place.getRp_createdate()
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
					script.println("location.href = 'review_place.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	<script>
	function validateForm() {
		  var comment = document.getElementsByName("rp_comment")[0].value;
		  if (comment === "") {
		    alert("후기를 작성해주세요!");
		    return false; // 제출 막기
		  }
		  return true; // 제출 허용
		}
	</script>
</body>
</html>