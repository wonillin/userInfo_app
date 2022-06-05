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
	
	String userName = null;
	if (request.getParameter("userName") != null) {
		user.setUserName(request.getParameter("userName"));
	}
	if (request.getParameter("userPassword") != null) {
		user.setUserPassword(request.getParameter("userPassword"));
	}
	if (request.getParameter("userGender") != null) {
		user.setUserGender(request.getParameter("userGender"));
	}
	if (request.getParameter("userAge") != null) {
		user.setUserAge(request.getParameter("userAge"));
	}
	if (request.getParameter("userAddress") != null) {
		user.setUserAddress(request.getParameter("userAddress"));
	}
	if (request.getParameter("userPhone") != null) {
		user.setUserPhone(request.getParameter("userPhone"));
	}
	
	
	if (!userID.equals(user.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("</script>");
	}else{
		if(request.getParameter("userPassword") == null || request.getParameter("userName") == null || request.getParameter("userGender") == null || request.getParameter("userAddress") == null || request.getParameter("userPhone") == null
				||request.getParameter("userPassword").equals("") || request.getParameter("userName").equals("")||request.getParameter("userGender").equals("") || request.getParameter("userAddress").equals("") || request.getParameter("userPhone").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.modify(user);
			if (result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else{
				System.out.println("update user href");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	}
	%>	
</body> 
</html>
