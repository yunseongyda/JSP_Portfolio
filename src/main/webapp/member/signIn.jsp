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
    <title>sign in</title>
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
		.divider:after,
		.divider:before {
			content: "";
			flex: 1;
			height: 1px;
			background: #eee;
		}
		
		.h-custom {
			height: calc(100% - 73px);
		}
		
		@media ( max-width : 450px) {
			.h-custom {
				height: 100%;
			}
		}
</style>
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
    <%@ include file="/step06/navi.jsp" %>
    <%-- <div class="container my-5" id="form_layout">
    	<h1 class="display-3 text-center">Sign in</h1>
    </div>
		<div class="container">
			<form name="signIn" class="form-horizontal" action='<c:url value="/member/processSignIn.jsp"/>' method="post">
				<div class="form-group row justify-content-center my-3">
					<label class="col-sm-2 ">아이디</label>
					<div class="col-sm-3">
						<input name="id" type="text" class="form-control" placeholder="id"
							required autofocus>
					</div>
				</div>
				<div class="form-group row justify-content-center my-3">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="pw" type="password" class="form-control"
							placeholder="password">
					</div>
				</div>
				<div class="form-group row justify-content-center my-3">
					<div class="col-sm-3">
						<div class="d-gird gap-2">
							<button class="mt-4 btn btn-lg btn-success btn-block" type="submit">로그인</button>
						</div>
					</div>
				</div>
				<%
					String error = request.getParameter("error");
					if (error != null)  {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디 또는 비밀번호가 잘못되었습니다.");
						out.println("</div>");
					}
				%>
			</form>
    	</div> --%>
    	
 
    	<section class="my-5">
		  <div class="container-fluid h-custom">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col-md-9 col-lg-6 col-xl-5">
		        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
		          class="img-fluid" alt="Sample image">
		      </div>
		      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
		        <form name="signIn" action='<c:url value="/member/processSignIn.jsp"/>' method="post">
		          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
		            <p class="lead fw-normal mb-0 me-3">Sign in with</p>
		            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-floating mx-1">
		              <i class="fab fa-github"></i>
		            </button>
		
		            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-floating mx-1">
		              <i class="fab fa-twitter"></i>
		            </button>
		
		            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-floating mx-1">
		              <i class="fab fa-linkedin-in"></i>
		            </button>
		
		            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-floating mx-1">
		        	  <i class="fab fa-google"></i>
		            </button>
		          </div>
		
		          <div class="divider d-flex align-items-center my-4">
		            <p class="text-center fw-bold mx-3 mb-0">Or</p>
		          </div>
		
		          <!-- Email input -->
		          <div data-mdb-input-init class="form-outline mb-4">
		            <input name="id" type="text" id="form3Example3" class="form-control form-control-lg"
		              placeholder="Enter a valid email address or User Id" />
		            <label class="form-label" for="form3Example3">Email address or User Id</label>
		          </div>
		
		          <!-- Password input -->
		          <div data-mdb-input-init class="form-outline mb-3">
		            <input name="pw" type="password" id="form3Example4" class="form-control form-control-lg"
		              placeholder="Enter password" />
		            <label class="form-label" for="form3Example4">Password</label>
		          </div>
		
		          <div class="d-flex justify-content-between align-items-center">
		            <!-- Checkbox -->
		            <div class="form-check mb-0">
		              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
		              <label class="form-check-label" for="form2Example3">
		                Remember me
		              </label>
		            </div>
		            <a href="#!" class="text-body">Forgot password?</a>
		          </div>
		
		          <div class="text-center text-lg-start mt-4 pt-2">
		            <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
		              style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
		            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href='<c:url value="/member/signUp.jsp" />'
		                class="link-danger">Register</a></p>
		          </div>
		
		        </form>
		      </div>
		    </div>
		  </div>
		</section>
    
    <!-- footer include -->
    <%@ include file="/step06/footer.jsp" %>


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