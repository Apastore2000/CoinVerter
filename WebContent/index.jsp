<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String name = request.getParameter("to");
	if(name == null || name.isEmpty()) name = "World";
%>

Hello <%= name %> !

<form action="login.jsp" method="post">
<input type="submit" value="go to login">
</form>



</body>
</html>