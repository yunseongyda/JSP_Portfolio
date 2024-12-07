<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Project" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>list</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath }/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <%
    	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
    	List boardList = (List)request.getAttribute("boardlist");
    	int total_record = (Integer)request.getAttribute("total_record");
    	int total_page = (Integer)request.getAttribute("total_page");
    %>
    
    
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
    
    <script>
    	let checkSignIn = () => {
    		if(${sessionId==null}) {
    			alert("로그인 해주세요.");
    			location.href="./member/signIn.jsp";
    			return false;
    		}
    		location.href="./BoardWriteForm.do?id=<%=sessionId %>";
    	}
    </script>
    
    
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown"><fmt:message key="community"/></h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#"><fmt:message key="home"/></a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#"><fmt:message key="pages"/></a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page"><fmt:message key="community"/></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container section-title">
    	<h2>게시판</h2>
    	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At error provident animi perferendis cupiditate harum quo! Suscipit placeat aspernatur voluptate delectus quos! Dolores facilis corporis quo voluptates placeat rerum dignissimos?</p>
    </div>
    <div class="text-center">
    	<span>전체 <%=total_record %>건</span>
    </div>
    <div class="container">
    	<form action='<c:url value="/BoardListAction.do" />' method="post">
    		<div class="text-right">
    			<span class="badge badge-primary">전체 건</span>
    		</div>
    		<div class="pt-5">
    			<table class="table table-hover">
    				<tr>
    					<th>번호</th>
    					<th>제목</th>
    					<th>작성일</th>
    					<th>수정일</th>
    					<th>조회</th>
    					<th>글쓴이</th>
    				</tr>
    				<%
    					for(int i=0; i<boardList.size(); i++){
    						BoardDTO boardDTO = (BoardDTO)boardList.get(i);
    				%>
    				<tr>
    					<td><%=boardDTO.getNum() %></td>
    					<td><%=boardDTO.getTitle() %></td>
    					<td><%=boardDTO.getRegist_date() %></td>
    					<td><%=boardDTO.getUpdate_date() %></td>
    					<td><%=boardDTO.getCount_click() %></td>
    					<td><%=boardDTO.getName() %></td>
    				</tr>
    				<%	
    					}
    				%>
    			</table>
    		</div>
    		
    		<div class="text-center">
    			<table class="w-100">
    				<tr>
    					<td width="150px" align="left">
	    					<select name="items" class="txt">
		    					<option value="title">제목에서</option>
		    					<option value="content">본문에서</option>
		    					<option value="name">글쓴이에서</option>
		    				</select>
		    				<input type="text" name="text" />
		    				<input type="submit" class="btn btn-info" value="검색" />
		    				<a class="btn btn-primary" href='<c:url value="/BoardListAction.do?pageNum=1"/>'>검색 초기화</a>
    					</td>
    					<td width="100" align="right">
    						<a href="#" onclick="checkSignIn()">글쓰기</a>
    					</td>
    				</tr>
    			</table>
    		</div>
    		
    		<!-- 페이징 구조 추가 -->
    		<div align="center">
    			<c:set var="pageNum" value="<%=pageNum %>" />
    			<c:forEach var="i" begin="1" end="<%=total_page %>">
    				<c:if test="${items != null && text != null }">
    					<a href='<c:url value="/BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>'>
    						<c:choose>
    							<c:when test="${pageNum == i }">
    								<b>[${i }]</b>
    							</c:when>
    							<c:otherwise>
    								[${i }]
    							</c:otherwise>
    						</c:choose>
    					</a>
    				</c:if>
    				<c:if test="${items == null && text == null }">
    					<a href='<c:url value="/BoardListAction.do?pageNum=${i}"/>'>
    						<c:choose>
    							<c:when test="${pageNum == i }">
    								<b>[${i }]</b>
    							</c:when>
    							<c:otherwise>
    								[${i }]
    							</c:otherwise>
    						</c:choose>
    					</a>
    				</c:if>
    			</c:forEach>
    			
    		</div>
    	</form>
    </div>
    
    
    
    
    
    
    
    <!-- footer include -->
    <%@ include file="/step06/footer.jsp" %>


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    </fmt:bundle>
</body>

</html>