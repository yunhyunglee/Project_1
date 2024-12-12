
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/css/adminMain.css" />
    <link rel="stylesheet" href="/css/admin-user.css" />


    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">



    <script src="/script/jquery-3.7.1.min.js"></script>


    <script src="/script/adminMain.js"></script>
    <script src="/script/admin-common.js"></script>


    <script src="/script/admin-qna.js"></script>

    <script src="/script/admin-notice.js"></script>
    <script src="/script/admin-banner.js"></script>



    <script src="/script/admin-user.js"></script>
    <script src="/script/admin-business.js"></script>
    <script src="/script/admin-reservation.js"></script>

</head>
<body>


<nav>
    <button class="section-btn" data-section="qna">QnA 관리</button>
    <button class="section-btn" data-section="user">회원 관리</button>
    <button class="section-btn" data-section="business">사업자 관리</button>
    <button class="section-btn" data-section="banner">배너 관리</button>
    <button class="section-btn" data-section="notice">공지사항 관리</button>
    <button class="section-btn" data-section="reservation">예약 관리</button>
    <button class="logout-btn" onclick="adminLogout()">로그아웃</button>
</nav>

<main id="section-content">
    <div class="welcome">
        <h2> 환영합니다!</h2>
        <p>메뉴를 선택하여 관리 작업을 시작하세요.</p>
    </div>
</main>



</body>
</html>
