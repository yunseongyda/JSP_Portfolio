<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제품 상세보기</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
 	<meta content="" name="description">
<!-- Favicon -->
    <link href="../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../resources/css/style.css" rel="stylesheet">
	
	<script>
		function addToLike() {
			if (confirm("이 포트폴리오에 좋아요를 누르시겠습니까?")) {
				document.addForm.submit();
			} else {
				document.addForm.reset();
			}
		}
	</script>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">

	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

	<!-- header include -->
    <%@ include file="navi.jsp" %>
    
    <div class="container mt-3">
    	<div class="row">
    		<h1>상품 상세 정보</h1>
    	</div>
    	
    	<%
    		String id = request.getParameter("id");
    		/* Product product = productDAO.getProductById(id); */
    		Product product = ProductRepository.getInstance().getProductById(id);
    		
    	%>
    	
    	<div class="row">
    		<div class="col-md-6">
    			<img class="img-fluid" src="../resources/img/product/<%=product.getFileName() %>" alt="">
    			<h3><%=product.getPname() %></h3>
    			<p>제품 설명: <%=product.getDescription() %></p>
    			<p>좋아요 수: <%=product.getQuantity() %></p>
    			<p>상품코드: <%=product.getProductId() %></p>
    			
    			<p>
    				<form action="./addLike.jsp?id=<%=product.getProductId() %>" name="addForm" method="post">
    					<a href="./index.jsp#products" class="btn btn-secondary rounded-3 my-2">포트폴리오 목록</a>
    					<input type="button" onclick="addToLike();" class="btn btn-danger rounded-3 my-2" value="좋아요"/>
    					<a href="./like.jsp" class="btn btn-info rounded-3 my-2">좋아요 목록</a>
    				</form>
    			</p>
    		</div>
    	</div>
    	
    </div> <!-- container -->
    
    
    <!-- footer include -->
    <%@ include file="footer.jsp" %>
    
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/lib/wow/wow.min.js"></script>
    <script src="../resources/lib/easing/easing.min.js"></script>
    <script src="../resources/lib/waypoints/waypoints.min.js"></script>
    <script src="../resources/lib/counterup/counterup.min.js"></script>
    <script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="../resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="../resources/js/main.js"></script>
    </fmt:bundle>
</body>
</html>