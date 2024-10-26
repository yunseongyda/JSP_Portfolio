<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>getFilesConfirmation</title>
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
    
    <!-- 주문정보를 저장할 변수 선언하고 초기화 -->
	<%
	String getFiles_likeId = "";
	String getFiles_name = "";
	String getFiles_email = "";
	String getFiles_mobile = "";
	String getFiles_specialNote = "";
	String getFiles_project = "";
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			String n = cookie.getName();
			
			if(n.equals("getFiles_likeId")) getFiles_likeId = cookie.getValue();
			if(n.equals("getFiles_name")) getFiles_name = cookie.getValue();
			if(n.equals("getFiles_email")) getFiles_email = cookie.getValue();
			if(n.equals("getFiles_mobile")) getFiles_mobile = cookie.getValue();
			if(n.equals("getFiles_project")) getFiles_project = cookie.getValue();
			if(n.equals("getFiles_specialNote")) getFiles_specialNote = cookie.getValue();
		}
	}
	%>
	
	<div class="container-fluid bg-light p-5">
    	<h1 class="p-5">프로젝트 파일 받기 완료</h1>
    </div>
    <div class="container mt-4">
    	<div class="row text-center">
    		<h2 class="text-center">프로젝트 파일 정보</h2>
    		<div class="col-12 alert alert-secondary ">
    			<div class="w-100 border">
    				<div class="text-start mb-1">
    					<b class="fw-bold">받을 주소</b>
    				</div>
    				<div class="text-start">
    					<p class="mb-0">이름 : <%out.println(getFiles_name); %></p>
    					<p class="mb-0">이메일 : <%out.println(getFiles_email); %></p>
    					<p class="mb-0">휴대전화 : <%out.println(getFiles_mobile); %></p>
    					<p class="mb-0">프로젝트 이름 : <%out.println(getFiles_project); %></p>
    					<p class="mb-0">메모 : <%out.println(getFiles_specialNote); %></p>
    				</div>
    				<table width="100%" class="table table-hover border mt-4">
    					<thead>
	    					<tr>
			    				<th>아이디</th>
			    				<th>이름</th>
			    				<th>설명</th>
			    				<th>좋아요 수</th>
			    			</tr>
    					</thead>
		    			
		    			<%
		    				int sum = 0; // 총 좋아요 수
		    				ArrayList<Product> likelist = (ArrayList<Product>)session.getAttribute("likeList");
		    				
		    				if (likelist == null) likelist = new ArrayList<Product>();
		    				
		    				for (int i=0; i<likelist.size(); i++) {
		    					Product product = likelist.get(i);
		    					sum += product.getQuantity();
		    			%>
		    			<tr>
		    				<td><%=product.getProductId() %></td>
		    				<td><%=product.getPname() %></td>
		    				<td><%=product.getDescription() %></td>
		    				<td><%=product.getQuantity() %></td>
		    			</tr>
		    			
		    			<%
		    				}
		    			%>
		    		</table>
    			
    			</div>
    		</div>
    		
    		
    	</div> <!-- row -->
    	<div class="row">
    		<p><a href="./index.jsp#portfolios">이메일을 확인해주세요.</a></p>
    	</div> <!-- row -->
    </div> <!-- container -->
    
    <!-- footer include -->
    <%@ include file="footer.jsp" %>


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
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