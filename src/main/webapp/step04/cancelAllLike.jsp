<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.catalina.startup.ClassLoaderFactory.Repository"%>
<%@page import="dto.Project"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cancelAllLike</title>
</head>
<body>
<%
String id = request.getParameter("likeId");
	ArrayList<Project> likelist = (ArrayList<Project>)session.getAttribute("likeList");
	likelist.clear();
	
	/* session.invalidate(); */	// 세션에 값이 있으면 모두 무효화하는 메소드
	response.sendRedirect("like.jsp");
%>
</body>
</html>