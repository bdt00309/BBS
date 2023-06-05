 <%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPasswd" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>


<%
	String userId = null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}	

	if(user.getUserId() == null || user.getUserPasswd() == null || user.getUserName() ==null ||  
		user.getUserGender() == null || user.getUserEmail() == null) {  // 아무것도 입력되지 않았을 때 null이 나오니까,
		PrintWriter script = response.getWriter(); 
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("histiory.back()");
		script.println("</script>");
		
	} else {
		UserDAO dao = new UserDAO();
		int result = dao.join(user);
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("histiory.back()");
			script.println("</script>");
			
		} else {
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
			
		} 
	}




	
	

%>
	
	
</body>
</html>



