<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원관리 시스템</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		user = new UserDAO().getUser(userID);
		if (!userID.equals(user.getUserID())) {
			PrintWriter script = response.getWriter();
		}
	%>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">회원관리 시스템</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="edit.jsp">회원정보수정</a></li>
			</ul>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="logoutAction.jsp">탈퇴하기</a></li>
					</ul>
				</li>		
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="editAction.jsp">
					<h3 style="text-align: center;">회원정보수정</h3>
					<hr>
				 	<div class="form-group">
				 		<input type="text" class="form-control" placeholder="아이디" name="userID" value="<%=user.getUserID()%>" maxlength="20" readonly>
				 	</div>
				 	<div class="form-group">
				 		<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				 	</div>
				 	<div class="form-group">
				 		<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
				 	</div>
				 	<div class="form-group">
				 		<input type="number" class="form-control" placeholder="나이" name="userAge" maxlength="20">
				 	</div>
				 	<div class="form-group" style="text-align: center;">
				 		<div class="btn-group" data-toggle="buttons">
				 			<label class ="btn btn-primary active">
				 				<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
				 			</label>
				 			<label class ="btn btn-primary">
				 				<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
				 			</label>
				 		</div>
				 	</div>		
				 	<div class="form-group">
				 		<input type="text" class="form-control" placeholder="주소" name="userAddress" maxlength="20">
				 	</div>
				 	<div class="form-group">
				 		<input type="number" class="form-control" placeholder="전화번호" name="userPhone" maxlength="20">
				 	</div>
				 	<input type="submit" class="btn btn-primary form-control" value="수정">
				</form>
			</div>
		</div>	
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body> 
</html>