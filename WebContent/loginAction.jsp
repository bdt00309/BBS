 <%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPasswd" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>


<%
	UserDAO dao = new UserDAO();
	int result = dao.login(user.getUserId(), user.getUserPasswd());
	if(result ==1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		
	} else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("histiory.back()");
		script.println("</script>");
		
	} else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("histiory.back()");
		script.println("</script>");
		
	} else if(result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이테베이스 오류가 발생했습니다.')");
		script.println("histiory.back()");
		script.println("</script>");
	}
	
	

%>
	
	
</body>
</html>



