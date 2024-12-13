<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Project" %>
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>like list</title>
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
    
	<%
    	String likeId = session.getId();	// JsessionId 얻어오는 메소드
    	%>
</head>

<body>

	<fmt:setLocale value='<%=request.getParameter("language")%>' />
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
    
    <div class="container-fluid bg-light my-4 p-5">
    	<h1 class="p-5">좋아요 목록</h1>
    </div>
    <div class="container">
    	<div class="row">
    		<table width="100%">
    			<tr>
    				<td align="left">
    					<a href="./cancelAllLike.jsp?likeId=<%=likeId%>" class="btn btn-danger rounded-3">좋아요 목록 모두 삭제하기</a>
    				</td>
    				<td align="right">
    					<a href="./getProjectFiles.jsp?likeId=<%=likeId%>" class="btn btn-success rounded-3">프로젝트 파일 받기</a>
    				</td>
    			</tr>
    		</table>
    	</div> <!-- row -->
    	<div class="row">
    		<table width="100%" class="table table-hover">
    			<tr>
    				<th>아이디</th>
    				<th>이름</th>
    				<th>설명</th>
    				<th>좋아요 수</th>
    				<th>좋아요 취소</th>
    			</tr>
    			<%
    			int sum = 0; // 총 좋아요 수
    			    				ArrayList<Project> likelist = (ArrayList<Project>)session.getAttribute("likeList");
    			    				
    			    				if (likelist == null) likelist = new ArrayList<Project>();
    			    				
    			    				for (int i=0; i<likelist.size(); i++) {
    			    					Project product = likelist.get(i);
    			    					sum += product.getP_like_count();
    			%>
    			<tr>
    				<td><%=product.getP_id() %></td>
    				<td><%=product.getP_name() %></td>
    				<td><%=product.getP_description() %></td>
    				<td><%=product.getP_like_count() %></td>
    				<td><a href="./cancelLike.jsp?id=<%=product.getP_id() %>" class="badge badge-danger text-danger border">좋아요 취소</a></td>
    			</tr>
    			
    			<%
    				}
    			%>
    			<tr>
    				<th></th>
    				<th></th>
    				<th>총 좋아요 수</th>
    				<th><%=sum %></th>
    				<th></th>
    			</tr>
    		</table>
    	</div> <!-- row -->
    </div>
    
    
    
    
    
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