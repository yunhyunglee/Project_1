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
    <script src="/script/mypage.js"></script>
    <script src="/script/productDetail.js"></script>

    <script src="/script/customer.js"></script>

    <link rel="stylesheet" href="/css/header_footer.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/product.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/loginForm.css" />
    <link rel="stylesheet" href="/css/join.css" />
    <link rel="stylesheet" href="/css/terms.css" />
    <link rel="stylesheet" href="/css/sidebar.css" />
    <link rel="stylesheet" href="/css/myPage.css" />
    <link rel="stylesheet" href="/css/category.css" />
    <script src="script/productDetail.js"></script>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-straight/css/uicons-solid-straight.css'>

</head>
<body>
    <div id="wrap">
        <header>
            <div id="logo">
                <a href="/">
                    <img src="http://placehold.co/180x100" alt="로고">
                </a>
            </div>
            <div class="search-bar">
                <form action="#" method="get">
                    <input type="text" name="query" placeholder="검색어를 입력하세요" required>
                    <button type="submit" class="search-btn" onclick="toggleSearchIcon(this)">
                        <i class="fi fi-rr-search"></i>
                    </button>
                </form>
            </div>
            <nav class="gnb">
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <a href="loginForm" class="nav-item">
                            <i class="fi fi-rr-user"></i>
                            <span class="label">login</span>
                        </a>
                        <a href="joinform" class="nav-item">
                            <i class="fi fi-rr-user-add"></i>
                            <span class="label">join</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="/mypage" class="nav-item">
                            <i class="fi fi-rr-circle-user"></i>
                            <span class="label">mypage</span>
                        </a>
                        <a href="/logout" class="nav-item">
                            <i class="fi fi-rr-exit"></i>
                            <span class="label">logout</span>
                        </a>
                    </c:otherwise>
                </c:choose>
                <a href="#" class="nav-item">
                    <i class="fi fi-rr-list"></i>
                    <span class="label">categories</span>
                </a>
                <a href="#" class="nav-item">
                    <i class="fi fi-rr-heart"></i>
                    <span class="label">wishlist</span>
                </a>
            </nav>

        </header>
