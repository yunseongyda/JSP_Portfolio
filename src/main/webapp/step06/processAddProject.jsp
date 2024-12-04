<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Project" %>
<%@ page import="dao.ProductRepository" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String fileName = "";
	String realFolder = application.getRealPath("/resources/img/portfolio/");
	String encType = "UTF-8";
	int maxSize = 5*1024*1024; // 5MB
	
	// 이미지 등록시 필요한 MultipartRequest의 생성자 함수를 이용하여 이미지 업로드에 대한 정보 설정
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String pId = multi.getParameter("p_id");
	String pName = multi.getParameter("p_name");
	String pDesc = multi.getParameter("p_description");
	// unitPrice 나중에 가격(숫자 넣을 때) 넣어
	String unitPrice = "20240919";
	/* out.print(productId);
	out.print(pName);
	out.print(pDesc);
	out.print(unitPrice);
	out.print("hi"); */
	
	int price;
	if (unitPrice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitPrice);
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	fileName = multi.getFilesystemName(fname);
	
	String pType = multi.getParameter("projectType");
	String lType = multi.getParameter("languageType");
	/* ProductRepository타입의 instance객체를 리턴받는다. */
	// ProductRepository dao = ProductRepository.getInstance();
	
	/* Product타입의 객체를 생성하고 사용자가 입력한 데이터로 제품정보를 설정 */
	/* Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(pName);
	newProduct.setDescription(pDesc);
	newProduct.setFileName(fileName); */
	// 숫자 넣을 때 아까 unitPrice 해논 거 말고 int로 선언한 price 넣으면 됨
	
	/* dao.addProduct(newProduct); */
	
	
	String sql = "insert into portfolio values(?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pId);
	pstmt.setString(2, pName);
	pstmt.setString(3, pDesc);
	pstmt.setString(4,fileName);
	pstmt.setInt(5, 0);
	pstmt.setString(6,pType);
	pstmt.setString(7,lType);
	pstmt.execute();
	response.sendRedirect("index.jsp#products");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processAddProduct</title>
</head>
<body>

</body>
</html>