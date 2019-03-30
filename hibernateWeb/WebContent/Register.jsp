<%@page import="com.niit.hiber.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Hibernate Demo</title>
</head>
<body>

<jsp:useBean id="userBean" class="com.niit.hiber.User"/>
<jsp:setProperty property="*" name="userBean"/>

<%
int i=UserDao.register(userBean);
if(i>0)
	out.print("You are successfully registered");
%>

</body>
</html>
  