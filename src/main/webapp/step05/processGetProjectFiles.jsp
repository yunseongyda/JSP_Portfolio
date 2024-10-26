<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>processGetProjectFiles</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

        // 쿠키 값 가져오기
        String likeIdValue = request.getParameter("likeId");
        String nameValue = request.getParameter("name");
        String emailValue = request.getParameter("email");
        String mobileValue = request.getParameter("mobile");
        String specialNoteValue = request.getParameter("specialNote");
        String projectValue = request.getParameter("project");

        // 공백 제거
        if (specialNoteValue != null) {
            specialNoteValue = specialNoteValue.trim().replace(" ", "_"); // 공백을 언더스코어로 변환
        }
        
        // 쿠키 생성
        Cookie likeId = new Cookie("getFiles_likeId", likeIdValue != null ? likeIdValue.trim() : "");
        Cookie name = new Cookie("getFiles_name", nameValue != null ? nameValue.trim() : "");
        Cookie email = new Cookie("getFiles_email", emailValue != null ? emailValue.trim() : "");
        Cookie mobile = new Cookie("getFiles_mobile", mobileValue != null ? mobileValue.trim() : "");
        Cookie specialNote = new Cookie("getFiles_specialNote", specialNoteValue != null ? specialNoteValue : "");
        Cookie project = new Cookie("getFiles_project", projectValue != null ? projectValue.trim() : "");

        // 쿠키의 유효시간 2시간으로 설정
        int maxAge = 2 * 60 * 60; // 2시간
        likeId.setMaxAge(maxAge);
        name.setMaxAge(maxAge);
        email.setMaxAge(maxAge);
        mobile.setMaxAge(maxAge);
        project.setMaxAge(maxAge);
        specialNote.setMaxAge(maxAge);

        // 쿠키 등록
        response.addCookie(likeId);
        response.addCookie(name);
        response.addCookie(email);
        response.addCookie(mobile);
        response.addCookie(project);
        response.addCookie(specialNote);

        // 주문 목록을 볼 수 있는 주문 정보 페이지로 이동
        response.sendRedirect("getFilesConfirmation.jsp");
    %>
</body>
</html>
