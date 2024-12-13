<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Project" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope ="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>view board</title>
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
    
	<script>
		let checkForm = () =>{
			if(!document.newWrite.name.value){
				alert("이름을 입력하세요");
				document.newWrite.name.focus()
				return false
			}
			if(!document.newWrite.title.value){
				alert("제목을 입력하세요");
				document.newWrite.title.focus()
				return false
			}
			if(!document.newWrite.content.value){
				alert("내용을 입력하세요");
				document.newWrite.content.focus()
				return false
			}
		}
	</script>
</head>
<%
	BoardDTO notice = (BoardDTO)request.getAttribute("board");
	int num= (Integer)request.getAttribute("num");
	int nowPage = (Integer)request.getAttribute("pageNum");
%>
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

    <!-- Topbar Start -->
    <%@ include file="/step06/navi.jsp" %>
    
    <!-- Topbar End -->

    <!-- Navbar Start -->
    <!-- Navbar content is included in navi.jsp, so no need for duplicate content here -->
    <!-- Navbar End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown"><fmt:message key="community" /></h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#"><fmt:message key="home" /></a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#"><fmt:message key="pages" /></a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page"><fmt:message key="community" /></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Contact Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 contact-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4"><%=notice.getTitle() %></h1>
                        </div>
                        <p class="mb-4">The contact form is currently inactive. Get a functional and working contact form with Ajax & PHP in a few minutes. Just copy and paste the files, add a little code and you're done. <a href="https://htmlcodex.com/contact-form">Download Now</a>.</p>
                        <form name="newWrite" action='./BoardUpdateActoin.do?num=<%=notice.getNum() %>&pageNum=<%=nowPage %>' onsubmit="return checkForm()" method="post">
                        	<input type="hidden" name="id" value="${sessionId }"/>
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="name" placeholder="Your Name" value="<%=notice.getName() %>" name="name">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="title" placeholder="Title" name="title" value="<%=notice.getTitle() %>">
                                        <label for="title">Title</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a message here" id="content" style="height: 100px" name="content"><%=notice.getContent() %>
                                        </textarea>
                                        <label for="content">Content</label>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <!-- <input class="btn btn-warning w-100 py-3" type="button" value="Previous" onclick="history.back()"/> -->
                                    <a href="./BoardListAction.do?pageNum=<%=nowPage %>" class="btn btn-warning w-100 py-3">Previous</a>
                                </div>
                                <div class="col-4">
                                	<c:set var="userId" value="<%=notice.getId() %>"/>
                                	<c:if test="${sessionId == userId }">
                                		<input class="btn btn-success w-100 py-3" type="submit" value="Edit"/>
                                	</c:if>
                                </div>
                                <div class="col-4">
                                	<c:set var="userId" value="<%=notice.getId() %>"/>
                                	<c:if test="${sessionId == userId }">
                                		<%-- <a class="btn btn-danger w-100 py-3" href="./BoardDelAction.do?pageNum=<%=nowPage %>&num=<%=num%>">Delete</a> --%>
                                		<!-- 삭제 버튼 -->
								<a class="btn btn-danger w-100 py-3" data-bs-toggle="modal"
									href="#deleteModal"> Delete
								</a>

								<!-- 모달 -->
								<div class="modal fade" id="deleteModal"
									tabindex="-1" aria-labelledby="deleteModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5"
													id="deleteModalLabel">정말 이 게시글을
													삭제하시겠습니까?</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												제목: 
												<%=notice.getTitle() %>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소</button>
												<a href="./BoardDelAction.do?pageNum=<%=nowPage %>&num=<%=num%>">
													<button type="button" class="btn btn-danger">삭제</button>
												</a>
											</div>
										</div>
									</div>
								</div>
                                	</c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6 pe-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <iframe class="position-absolute w-100 h-100" style="object-fit: cover;"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
                        frameborder="0" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->

    <!-- Footer Start -->
    <%@ include file="/step06/footer.jsp" %>
    <!-- Footer End -->

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
