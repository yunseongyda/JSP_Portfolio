<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Topbar Start -->
    <div class="container-fluid bg-light p-0">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-map-marker-alt text-primary me-2"></small>
                    <small><fmt:message key="address" /></small>
                </div>
                <div class="h-100 d-inline-flex align-items-center py-3">
                    <small class="far fa-clock text-primary me-2"></small>
                    <small><fmt:message key="workingTime" /></small>
                    <h3 class="mx-5">
    					<a href="&language=ko" >Korean</a> |
    					<a href="&language=en" >English</a>
    				</h3>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-phone-alt text-primary me-2"></small>
                    <small>+012 345 6789</small>
                </div>
                <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-0" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href='<c:url value="/step06/index.jsp" />' class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">WooDY</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href='<c:url value="index.jsp" />' class="nav-item nav-link active"><fmt:message key="home" /></a>
                <a href='<c:url value="index.jsp#portfolios" />' class="nav-item nav-link"><fmt:message key="portfolio"/></a>
                <a href='<c:url value="portfolioCollection.jsp" />' class="nav-item nav-link"><fmt:message key="portfolioCollection" /></a>
                <div class="nav-item dropdown">
                    <a href='<c:url value="addProduct.jsp" />' class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><fmt:message key="addProject" /></a>
                    <div class="dropdown-menu fade-up m-0">
                        <a href='<c:url value="addProject.jsp" />' class="dropdown-item"><fmt:message key="addProject" /></a>
                        <a href='<c:url value="index.jsp?edit=update#portfolios" />' class="dropdown-item"><fmt:message key="modifyProject" /></a>
                        <a href='<c:url value="index.jsp?edit=delete#portfolios" />' class="dropdown-item"><fmt:message key="deleteProject" /></a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="addProduct.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><fmt:message key="signIn" /></a>
                    <div class="dropdown-menu fade-up m-0">
                        <a href='<c:url value="/member/signIn.jsp" />' class="dropdown-item"><fmt:message key="signIn" /></a>
                        <a href='<c:url value="/member/signUp.jsp" />' class="dropdown-item"><fmt:message key="signUp" /></a>
                    </div>
                </div>
                <a href='<c:url value="contact.jsp" />' class="nav-item nav-link"><fmt:message key="contactMe"/></a>
            </div>
            <a href="" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block"><fmt:message key="readMore" /><i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->