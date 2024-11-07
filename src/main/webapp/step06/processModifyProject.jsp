<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String modifiedFileName = "";
	String realFolder = application.getRealPath("/resources/img/portfolio/");
	String encType = "UTF-8";
	int maxSize = 5*1024*1024; // 5MB
	
	// 이미지 등록시 필요한 MultipartRequest의 생성자 함수를 이용하여 이미지 업로드에 대한 정보 설정
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String modifiedPId = multi.getParameter("p_id");
	String modifiedPName = multi.getParameter("p_name");
	String modifiedPDesc = multi.getParameter("p_description");
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
	modifiedFileName = multi.getFilesystemName(fname);
	if (modifiedFileName == null || modifiedFileName.equals("")) {
		modifiedFileName = request.getParameter("imgName");
	}
	
	String modifiedPType = multi.getParameter("projectType");
	String modifiedLType = multi.getParameter("languageType");
	String id = request.getParameter("id");
	System.out.println(id);
	/* ProductRepository타입의 instance객체를 리턴받는다. */
	// ProductRepository dao = ProductRepository.getInstance();
	
	/* Product타입의 객체를 생성하고 사용자가 입력한 데이터로 제품정보를 설정 */
	/* Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(pName);
	newProduct.setDescription(pDesc);
	newProduct.setFileName(modifiedFileName); */
	// 숫자 넣을 때 아까 unitPrice 해논 거 말고 int로 선언한 price 넣으면 됨
	
	/* dao.addProduct(newProduct); */
	
	
	String sql = "update portfolio set p_id = ?, p_name = ?, p_description = ?, p_img_name = ?, p_type = ? ,p_language_type = ? where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, modifiedPId);
	pstmt.setString(2, modifiedPName);
	pstmt.setString(3, modifiedPDesc);
	pstmt.setString(4, modifiedFileName);
	pstmt.setString(5, modifiedPType);
	pstmt.setString(6, modifiedLType);
	pstmt.setString(7, id);
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