<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/header.js"></script>
    <script src="/script/main.js"></script>
    <script src="/script/member.js"></script>
    <script src="/script/productDetail.js"></script>

    <script src="/script/customer.js"></script>


    <link rel="stylesheet" href="/css/header_footer.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/product.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/loginForm.css" />
    <link rel="stylesheet" href="/css/sidebar.css" />
    <link rel="stylesheet" href="/css/myPage.css" />
    <link rel="stylesheet" href="/css/category.css" />
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>

    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>

</head>
<body>
<%--<div id="wrap">--%>
<%--    <!-- 작은 헤더 -->--%>
<%--    <div id="header-top">--%>
<%--        <div class="login-signup">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty loginUser}">--%>
<%--                    <a href="loginForm">로그인</a>--%>
<%--                    <a href="joinform">회원가입</a>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <a href="#">${loginUser.name}(${loginUser.id})님</a>--%>
<%--                    <a href="logout">로그아웃</a>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- 로고와 검색창 -->--%>
<%--&lt;%&ndash;    <div class="header-color">&ndash;%&gt;--%>
<%--        <header>--%>
<%--            <div id="logo-search-container">--%>
<%--                <div id="logo">--%>
<%--                    <a href="/">--%>
<%--                        <img src="http://placehold.co/180x100" alt="로고">--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <div class="search-bar">--%>
<%--                    <form action="#" method="get">--%>
<%--                        <input type="text" name="query" placeholder="검색어를 입력하세요" required>--%>
<%--                        <button type="submit" class="search-btn" onclick="toggleSearchIcon(this)">--%>
<%--                            <i class="fi fi-rr-search"></i>--%>
<%--                        </button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
    <div id="wrap">
    <!-- 작은 헤더 -->
    <div id="header-top">
        <div class="login-signup">
            <c:choose>
                <c:when test="${empty loginUser}">
                    <a href="loginForm">로그인</a>
                    <a href="joinform">회원가입</a>
                </c:when>
                <c:otherwise>
                    <a href="#">${loginUser.name}(${loginUser.id})님</a>
                    <a href="logout">로그아웃</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 메인 헤더 (배경 이미지 적용) -->
    <header>
        <div id="logo-search-container">
            <div id="logo">
                <a href="/">
                    <img src="http://placehold.co/180x100" alt="로고">
                </a>
            </div>
            <!-- 검색창 -->
            <div class="search-bar">
                <form action="#" method="get">
                    <input type="text" name="query" placeholder="검색어를 입력하세요" required>
                    <button type="submit" class="search-btn" onclick="toggleSearchIcon(this)">
                        <i class="fi fi-rr-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </header>




<%--        <!-- gnb 메뉴 -->--%>
<%--        <div class="gnb">--%>
<%--            <div class="left">--%>
<%--                <a href="javascript:void(0);" id="categoryMenuBtn">--%>
<%--                    <i class="fi fi-rr-align-justify"></i>--%>
<%--                </a>--%>
<%--                <div id="categoryMenu">--%>
<%--                    <a href="category?category=11">--%>
<%--                        <i class="fi fi-rr-category"></i> <!-- 아이콘 -->--%>
<%--                        <span class="category-text">카테고리 11</span> <!-- 텍스트 -->--%>
<%--                    </a>--%>
<%--                    <a href="category?category=12">--%>
<%--                        <i class="fi fi-rr-category"></i> <!-- 아이콘 -->--%>
<%--                        <span class="category-text">카테고리 12</span> <!-- 텍스트 -->--%>
<%--                    </a>--%>
<%--                    <a href="category?category=13">--%>
<%--                        <i class="fi fi-rr-category"></i> <!-- 아이콘 -->--%>
<%--                        <span class="category-text">카테고리 13</span> <!-- 텍스트 -->--%>
<%--                    </a>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <div class="right">--%>
<%--                <a href="mypage"><i class="fi fi-rr-circle-user"></i></a>--%>
<%--                <a href="#"><i class="fi fi-rr-heart"></i></a>--%>
<%--            </div>--%>

<%--        </div>--%>

    <!-- gnb 메뉴 -->
    <div class="gnb">
        <div class="left">
            <a href="javascript:void(0);" id="categoryMenuBtn">
                <i class="fi fi-rr-align-justify"></i>
            </a>
            <div id="categoryMenu">
                <a href="category?category=11">
                    <i class="fi fi-rr-category"></i>
                    <span class="category-text">카테고리 11</span>
                </a>
                <a href="category?category=12">
                    <i class="fi fi-rr-category"></i>
                    <span class="category-text">카테고리 12</span>
                </a>
                <a href="category?category=13">
                    <i class="fi fi-rr-category"></i>
                    <span class="category-text">카테고리 13</span>
                </a>
            </div>
        </div>
        <div class="right">
            <a href="mypage"><i class="fi fi-rr-circle-user"></i></a>
            <a href="#"><i class="fi fi-rr-heart"></i></a>
        </div>
    </div>
