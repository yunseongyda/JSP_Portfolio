<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%

// 상품의 id를 전송받아 저장하고 전송된 아이디가 없을 때 index.jsp로 이동
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("index.jsp");
		return;
	}

// 상품 데이터 싱글톤 객체 얻어오기
	ProductRepository dao = ProductRepository.getInstance();
// 상품 아이디를 이용해서 상품객체를 얻어오기
	Product product = dao.getProductById(id);

// 상품 객체가 없으면 예외처리 페이지로 이동
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

// 상품 목록을 얻어오도록 getAllProducts() 호출하고 리스트로 저장
	ArrayList<Product> portfoliosList = dao.getAllProducts();
	Product portfolios = new Product();
	
	for (int i=0; i<portfoliosList.size(); i++) {
		portfolios = portfoliosList.get(i);
		
		if (portfolios.getProductId().equals(id)) {
			break;
		}
	}
	
// 세션 속성이름 likeList(좋아요 목록)의 세션 정보(좋아요 목록에 등록된 데이터)를 얻어와 리스트 객체에 저장
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("likeList");
	
	if (list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("likeList", list);
	}

// cnt변수 생성
	int cnt = 0;
	Product portfoliosQnt = new Product();
	
	for (int i=0; i<list.size(); i++) { // 좋아요 목록에 담긴 포폴 리스트의 수만큼 loop
		portfoliosQnt = list.get(i);	// 첫 번째 상품부터 객체에 담고
		
		if (portfoliosQnt.getProductId().equals(id)) { // 요청한 파라미터 아이디 포폴이 좋아요에 담긴 목록이라면
			cnt++;
			int likedQuantity = portfoliosQnt.getQuantity()+1; // 기존 좋아요 수량에 1을 더하여
			portfoliosQnt.setQuantity(likedQuantity); 	// 해당 수량으로 저장
		}
	}
	
	if (cnt == 0) {
		portfolios.setQuantity(1);
		list.add(portfolios);	// 좋아요 리스트에 새로운 포폴 추가
	}
	
	response.sendRedirect("product.jsp?id="+id);
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