<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Project" %>
<%@ page import="dao.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>sign up</title>
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
    	#form_layout {
    		/* border: 1px solid red; */
    		/* margin: 200px 100px; */
    	}
    </style>
    <script>
    	function checkForm() {
    		if (!document.signUp.id.value) {
    			alert("아이디를 입력해주세요.")
    			return false;
    		}
    		if (!document.signUp.password.value) {
    			alert("비밀번호를 입력해주세요.")
    			return false;
    		}
    		if (!document.signUp.password_confirm.value) {
    			alert("비밀번호 확인을 입력해주세요.")
    			return false;
    		}
    		if (!document.signUp.name.value) {
    			alert("이름을 입력해주세요.")
    			return false;
    		}
    		if (!document.signUp.gender.value) {
    			alert("성별을 입력해주세요.")
    			return false;
    		}
    		var select_month = document.getElementById("month");
    		if (!document.signUp.birthyy.value || !document.signUp.birthdd.value || select_month.value==="") {
    			alert("생년월일을 입력해주세요.")
    			return false;
    		}
    		if (!document.signUp.mail1.value || !document.signUp.mail2.value) {
    			alert("이메일을 입력해주세요.")
    			return false;
    		}
    		document.signUp.submit();
    	}
    </script>
    
    <sql:setDataSource var="dataSource" 
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver"
	user="C##dbexam"
	password="m1234" />

	<%String _sessionId = (String)session.getAttribute("sessionId"); %>
	
	<sql:query dataSource="${dataSource }" var="resultSet">
		select * from member where id =?
		<sql:param value="<%=_sessionId %>"/>
	</sql:query>
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
    <%@ include file="../step06/navi.jsp" %>
    
    <div class="container my-5" id="form_layout">
    	<h1 class="display-3 text-center">edit info</h1>
    </div>
		<div class="container">
		<c:forEach items="resultSet.rows" var=row>
			<form name="signUp" class="form-horizontal" action='<c:url value="/member/processSignUp.jsp"/>' method="post">
				<div class="gap-3">
					<div class="form-group row">
						<label class="col-sm-2 ">아이디</label>
						<div class="col-sm-3">
							<input name="id" type="text" class="form-control" placeholder="id"
								required autofocus value='<c:out value="${row.id }" />'>
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2">비밀번호</label>
						<div class="col-sm-3">
							<input name="password" type="password" class="form-control"
								placeholder="password">
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2">비밀번호확인</label>
						<div class="col-sm-3">
							<input name="password_confirm" type="password" class="form-control"
								placeholder="password confirm">
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2">성명</label>
						<div class="col-sm-3">
							<input name="name" type="text" class="form-control"
								placeholder="name">
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2">성별</label>
						<div class="col-sm-10">
							<input name="gender" type="radio" value="m" /> 남 
							<input name="gender" type="radio" value="f" /> 여
							<input name="gender" type="radio" value="unknown" /> 밝히지 않음
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2">생일</label>
						<div class="col-sm-6">
							<!-- <input type="number" min="1900" max="2023" value="1980" class="form-control" placeholder="id" name='id'> -->
							<input type="text" name="birthyy" maxlength="4"
								placeholder="년(4자)" size="6" class="form-control w-25 d-inline">
							<select name="birthmm" class="form-control w-25 d-inline" id="month">
								<option value="">월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
								size="4" class="form-control w-25 d-inline">
						</div>
					</div>
					<div class="form-group row my-3 ">
						<label class="col-sm-2">이메일</label>
						<div class="col-sm-10">
							<input type="text" name="mail1" maxlength="50">@ <select
								name="mail2">
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
								<option>nate.com</option>
							</select>
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-3">
							<input name="mobile" type="text" class="form-control"
								placeholder="mobile">
						</div>
					</div>
					<div class="form-group row my-3">
						<label class="col-sm-2 ">주소</label>
						<div class="col-sm-5">
							<input name="address" type="text" class="form-control"
								placeholder="address">
						</div>
					</div>
					<div class="form-group row my-3">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="button" class="btn btn-primary " value="등록 "
								onclick="checkForm()"> <input type="reset"
								class="btn btn-primary " value="취소 " onclick="reset()">
						</div>
					</div>
				</div>
			</form>
		</c:forEach>
		</div>
    
    
    
    
    
    <!-- footer include -->
    <%@ include file="../step06/footer.jsp" %>


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