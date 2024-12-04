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
<title>cancelLike</title>
</head>
<body>
<%
String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("index.jsp#products");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	Project product = dao.getProductById(id);	// 상품 아이디에 해당하는 객체 얻어옴
	
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	// 세션에 저장되어 있는 좋아요 리스트를 얻어와서 좋아요에 등록된 모든 포폴을 가져옴
	ArrayList<Project> likelist = (ArrayList<Project>)session.getAttribute("likeList");
	// 포폴 객체 생성
	Project portfoliosQnt = new Project();
	for (int i=0; i<likelist.size(); i++) {	// 좋아요 리스트에 등록된 포폴을 하나씩 가져와서
		portfoliosQnt = likelist.get(i);
		if (portfoliosQnt.getProductId().equals(id)) {
	likelist.remove(portfoliosQnt);
		}
	}
	response.sendRedirect("like.jsp");
%>
</body>
</html>