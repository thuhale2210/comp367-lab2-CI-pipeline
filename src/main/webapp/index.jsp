<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
java.util.Calendar calendar = java.util.Calendar.getInstance();
int hour = calendar.get(java.util.Calendar.HOUR_OF_DAY);
String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
%>
<!DOCTYPE html>
<html>
<head>
<title>COMP367 Web App</title>
</head>
<body>
	<h1><%=greeting%>, Thu Ha Le, Welcome to COMP367
	</h1>
</body>
</html>
