<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Project" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addProduct</title>
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
    
    <style>
    	input[type="file"] {
    		opacity:0!important
    	}
    	
    	.file-label {
    		background-color: lightgray;
    		padding: 10px 20px;
    		border-radius: 5px;
    		cursor: pointer;
    	}
    	#file-name {
    		position: relative;
    		top: -74px;
    		left: 135px;
    		display: block;
    	}
    </style>
    
    <script>
    	function updateFileName() {
    		const input = document.getElementById("pImg");
    		const fileNameLabel = document.getElementById("file-name");
    		if (input.files.length > 0) {
    			fileNameLabel.textContent = input.files[0].name;
    		} else {
    			fileNameLabel.textContent = "선택된 파일 없음"
    		}
    	}
    
    	// 언어 변경 함수
    	function changeLanguage(lang) {
    		const fileLabelText = document.getElementById("file-label-text");
    		const fileNameLabel = document.getElementById("file-name");
    		
    		if (lang === "ko") {
    			fileLabelText.textContent = "파일 선택";
    			fileNameLabel.textContent = "선택된 파일 없음";
    		} else {
    			fileLabelText.textContent = "Select File";
        		fileNameLabel.textContent = "Not found";
    		}
    		

    	}
    </script>
    
</head>
<body>
	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

	<!-- 한글과 영문 중에 원하는 언어를 선택할 수 있도록 설정 -->
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">

	<!-- header include -->
    <%@ include file="navi.jsp" %>
    
    <div class="container mt-3">
    	<div class="row">
    		<div class="col">
    			<h1><fmt:message key="title" /></h1>
    			<br />
    		</div>
    		<div class="col">
    			<h3>
    				<a href="?language=ko" onclick="changeLanguage('ko')">Korean</a> |
    				<a href="?language=en" onclick="changeLanguage('en')">English</a>
    			</h3>
    		</div>
    	</div>
    	
    	<%
    	    	String id = request.getParameter("id");
    	    	    		Project product = productDAO.getProductById(id);
    	    	%>

		<div class="row">
			<form class="g-3" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data" name="registNewProduct">
				<div class="row m-3">
					<div class="col-2">
						<label for="newProduct" class=""><fmt:message key="productId" /></label>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="newProduct" name="newProduct">
					</div>
				</div>
				<div class="row m-3">
					<div class="col-2">
						<label for="pName" class=""><fmt:message key="pname" /></label>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="pName" name="pName">
					</div>
				</div>
				<div class="row m-3">
					<div class="col-2">
						<label for="pDesc" class=""><fmt:message key="description" /></label>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="pDesc" name="pDesc">
					</div>
				</div>
				<div class="row m-3">
					<div class="col-2">
						<label for="pImg" class=""><fmt:message key="fileName" /></label>
					</div>
					<div class="col-4">
						<label for="pImg" class="file-label">
							<span id="file-label-text"><fmt:message key="fileSelect" /></span>
						</label>
						<input type="file" class="form-control" id="pImg" name="pImg" onchange="updateFileName()">
						<span id="file-name"><fmt:message key="noFile" /></span>
					</div>
				</div>

				<div class="col-auto">
					<input type="button" class="btn btn-primary mb-3" value="<fmt:message key="button" />" onclick="check_form_addProduct()"></input>
				</div>
			</form>
		</div>

	</div> <!-- container -->
    
    </fmt:bundle>
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
    <!-- 유효성 검증 js -->
 	<script src="../resources/js/validation.js"></script>
</body>
</html>