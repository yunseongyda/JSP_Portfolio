<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
	request.setCharacterEncoding("UTF-8");
	String productId = request.getParameter("newProduct");
	String pName = request.getParameter("pName");
	String pDesc = request.getParameter("pDesc");
	// unitPrice 나중에 가격(숫자 넣을 때) 넣어
	String unitPrice = "20240919";
	out.print(productId);
	out.print(pName);
	out.print(pDesc);
	out.print(unitPrice);
	out.print("hi");
	
	int price;
	if (unitPrice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitPrice);
	
	/* ProductRepository타입의 instance객체를 리턴받는다. */
	ProductRepository dao = ProductRepository.getInstance();
	
	/* Product타입의 객체를 생성하고 사용자가 입력한 데이터로 제품정보를 설정 */
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(pName);
	newProduct.setDescription(pDesc);
	// 숫자 넣을 때 아까 unitPrice 해논 거 말고 int로 선언한 price 넣으면 됨
	
	dao.addProduct(newProduct);
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