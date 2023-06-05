<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


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
	
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} 
	
	int bbsId = 0;
	if(request.getParameter("bbsId") != null) {
		bbsId = Integer.parseInt(request.getParameter("bbsId"));
	}
	
	if(bbsId == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	
	Bbs bbs = new BbsDAO().getBbs(bbsId);
	if(!userId.equals(bbs.getUserId())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	
	else {
		if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
				PrintWriter script = response.getWriter(); 
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("histiory.back()");
				script.println("</script>");
				
			} else {
				BbsDAO dao = new BbsDAO();
				int result = dao.update(bbsId, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다.')");
					script.println("histiory.back()");
					script.println("</script>");
					
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
					
				} 
	}

	
	}




	
	

%>
	
	
</body>
</html>



