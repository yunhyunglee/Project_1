<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/member.js"></script>
    <script src="/script/customer.js"></script>
    <link rel="stylesheet" href="/css/customer_main.css" />
    <link rel="stylesheet" href="/css/customer_header.css" />
</head>
<body>
<div id="wrap">
    <header>
        <nav id="top_menu">
            <div id="logo">
                <a href="/">
                    <img src="http://placehold.co/180x100">
                </a>
            </div>

           <div class="gnb">
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <a href="loginForm">로그인</a>
                    </c:when>
                    <c:otherwise>
                        <a href="#">${loginUser.name}(${loginUser.id})</a>
                        <a href="logout">로그아웃</a>
                    </c:otherwise>
                </c:choose>
                <a href="cartList">#</a>
                <a href="mypage">마이페이지</a>

			</div>
        </nav>

    </header>
