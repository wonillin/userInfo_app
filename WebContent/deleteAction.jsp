<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html" charset="UTF-8">
<title>회원관리 시스템</title>
</head>
<body>
	<%
			String userID = null;
			if(session.getAttribute("userID")!=null);{
			user.setUserID((String)session.getAttribute("userID"));
				userID = (String) session.getAttribute("userID");
			}

			UserDAO userDAO = new UserDAO();
			int result = userDAO.delete(userID);
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('탈퇴에 성공하셨습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				session.invalidate();
			}
	%>	
</body> 
</html>
