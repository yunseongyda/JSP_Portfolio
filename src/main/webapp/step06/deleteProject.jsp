<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String pId = request.getParameter("id");
	String sql = "delete from portfolio where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pId);
	rs = pstmt.executeQuery();
	rs.next();
	response.sendRedirect("../ProjectListAction.do");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteProject</title>
</head>
<body>

</body>
</html>