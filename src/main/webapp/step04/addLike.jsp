<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addLike</title>
</head>
<body>

</body>
</html>