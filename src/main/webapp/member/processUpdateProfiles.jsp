<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String newPassword = request.getParameter("new_password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");
	String birth = year+"-"+month+"-"+day;
	
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail = mail1+"@"+mail2;
	
	String address = request.getParameter("address");
	String mobile = request.getParameter("mobile");
	String sessionId = (String)session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource" 
url="jdbc:oracle:thin:@localhost:1521:xe"
driver="oracle.jdbc.driver.OracleDriver"
user="C##dbexam"
password="m1234" />


<sql:update dataSource="${dataSource}"
var="resultSet" > 
update member set id=?, password=?, name=?, gender=?, birth=?, mail=?, address=?, mobile=? where id = ?
	<sql:param value="<%=id %>" />
	<sql:param value="<%=newPassword %>" />
	<sql:param value="<%=name %>" />
	<sql:param value="<%=gender %>" />
	<sql:param value="<%=birth %>" />
	<sql:param value="<%=mail %>" />
	<sql:param value="<%=address %>" />
	<sql:param value="<%=mobile %>" />
	<sql:param value="<%=sessionId %>" />
</sql:update>

<c:if test="${resultSet>=1 }">
	<c:redirect url="resultMember.jsp?msg=3" />
</c:if>

</body>
</html>