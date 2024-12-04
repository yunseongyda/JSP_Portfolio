<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.Project" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Woody - Carpenter Website Template</title>
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
    <link href="${pageContext.request.contextPath }/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
</head>

<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">

    <!-- Topbar -->
    <%@ include file="../step06/navi.jsp" %>

    <!-- Page Header -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown"><fmt:message key="portfolio"/></h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="${pageContext.request.contextPath }/resources/index.jsp"><fmt:message key="home"/></a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#"><fmt:message key="pages"/></a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page"><fmt:message key="portfolio"/></li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Projects -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5"><fmt:message key="my"/> <fmt:message key="portfolio" /></h1>
            </div>
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter="*"><fmt:message key="all" /></li>
                        <li class="mx-2" data-filter=".first"><fmt:message key="py" /></li>
                        <li class="mx-2" data-filter=".second"><fmt:message key="da"/></li>
                        <li class="mx-2" data-filter=".third"><fmt:message key="java" /></li>
                        <li class="mx-2" data-filter=".fourth"><fmt:message key="wd" /></li>
                    </ul>
                </div>
            </div>
				<div class="container mb-5">
					<form class="row center">
						<div class="col-11">
							<input type="text" class="form-control form-control-lg"
								placeholder="<fmt:message key="searchPj" />" name="constraint">
						</div>
						<div class="col-1 center">
							<button type="submit" class="btn btn-success form-control-lg"><i class="fas fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="row g-4 portfolio-container">
            <%
            	List<Project> projects = (List<Project>)request.getAttribute("projects");
            	for (int i=0; i<projects.size(); i++) {
            %>
            
                <div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.1s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="${pageContext.request.contextPath }/resources/img/portfolio/<%=projects.get(i).getP_img_name() %>" alt="">
                            <div class="portfolio-overlay">
                                <a class="btn btn-square btn-outline-light mx-1" href="${pageContext.request.contextPath }/resources/img/portfolio/<%=projects.get(i).getP_img_name() %>" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-square btn-outline-light mx-1" href="#"><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                        <div class="border border-5 border-light border-top-0 p-4">
                            <p class="text-primary fw-medium mb-2"><%=projects.get(i).getP_name() %></p>
                            <h5 class="lh-base mb-0"><%=projects.get(i).getP_description() %></h5>
                            <p><%=projects.get(i).getP_like_count() %></p>
                        	<a class="fw-medium" href="./project.jsp?id=<%=projects.get(i).getP_id() %>"><fmt:message key="readMore"/><i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
              <%
            	}
              %>
            </div> <!-- container -->
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="/step06/footer.jsp" %>

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary btn-lg btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    </fmt:bundle>
</body>

</html>
