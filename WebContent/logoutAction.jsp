<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html" charset="UTF-8">
<title>회원관리 시스템</title>
</head>
<body>
	<% 
		session.invalidate();
	%>
	<script>
		location.href = 'main.jsp';
	</script>
	
</body> 
</html>