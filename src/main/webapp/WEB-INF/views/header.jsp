<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <script src="/script/jquery-3.7.1.min.js"></script>--%>
<%--    <script src="/script/member.js"></script>--%>
<%--    <link rel="stylesheet" href="/css/header_footer.css" />--%>
<%--    <link rel="stylesheet" href="/css/main.css" />--%>
<%--    <link rel="stylesheet" href="/css/product.css" />--%>
<%--    <link rel="stylesheet" href="/css/section.css" />--%>
<%--    <link rel="stylesheet" href="/css/loginForm.css" />--%>
<%--    <link rel="stylesheet" href="/css/mypage.css" />--%>

<%--    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>--%>
<%--    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>--%>
<%--    <script type="text/javascript">--%>

<%--        $(document).ready(function() {--%>
<%--            $('#categoryMenuBtn').click(function() {--%>
<%--                $('#categoryMenu').toggle();  // 메뉴 표시/숨기기 토글--%>
<%--            });--%>
<%--        });--%>

<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="wrap">--%>
<%--    <header>--%>
<%--    <nav id="top_menu">--%>
<%--        <div id="logo">--%>
<%--            <a href="/">--%>
<%--                <img src="http://placehold.co/180x100">--%>
<%--            </a>--%>
<%--        </div>--%>

<%--        <div class="search-bar">--%>
<%--            <form action="searchResult.jsp" method="get">--%>
<%--                <input type="text" name="query" placeholder="검색어를 입력하세요" required>--%>
<%--                <button type="submit" class="search-btn" onclick="toggleSearchIcon(this)">--%>
<%--                    <i class="fi fi-rr-search"></i>--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>

<%--        <div class="gnb">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty loginUser}">--%>
<%--                    <a href="loginForm"><i class="fi fi-rr-user"></i></a>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <a href="#">${loginUser.name}(${loginUser.id})님</a>--%>
<%--                    <a href="logout"><i class="fi fi-rr-exit"></i></a>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty loginUser}">--%>

<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <a href="mypage"><i class="fi fi-rr-circle-user"></i></a>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--            <a href="heart"><i class="fi fi-rr-heart"></i></a>--%>
<%--            <a href="javascript:void(0);" id="categoryMenuBtn"><i class="fi fi-rr-align-justify"></i></a>--%>

<%--            <div id="categoryMenu">--%>
<%--                <a href="category?category=11">카테고리 11</a>--%>
<%--                <a href="category?category=12">카테고리 12</a>--%>
<%--                <a href="category?category=13">카테고리 13</a>--%>
<%--            </div>--%>

<%--&lt;%&ndash;            <a href="mypage"><i class="fa-solid fa-user"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a href="customer">고객센터</a>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--    </header>--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <script src="/script/jquery-3.7.1.min.js"></script>--%>
<%--    <script src="/script/member.js"></script>--%>
<%--    <link rel="stylesheet" href="/css/header_footer.css" />--%>
<%--    <link rel="stylesheet" href="/css/main.css" />--%>
<%--    <link rel="stylesheet" href="/css/product.css" />--%>
<%--    <link rel="stylesheet" href="/css/section.css" />--%>
<%--    <link rel="stylesheet" href="/css/loginForm.css" />--%>
<%--    <link rel="stylesheet" href="/css/mypage.css" />--%>
<%--    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>--%>
<%--    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>--%>
<%--    <script type="text/javascript">--%>
<%--        $(document).ready(function() {--%>
<%--            $('#categoryMenuBtn').click(function() {--%>
<%--                $('#categoryMenu').toggle();  // 메뉴 표시/숨기기 토글--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="wrap">--%>
<%--    <!-- 작은 헤더 -->--%>
<%--    <div id="header-top">--%>
<%--        <div class="login-signup">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty loginUser}">--%>
<%--                    <a href="loginForm">로그인</a>--%>
<%--                    <a href="signupForm">회원가입</a>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <a href="#">${loginUser.name}(${loginUser.id})</a>--%>
<%--                    <a href="logout">로그아웃</a>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- 로고와 검색창 -->--%>
<%--    <header>--%>
<%--        <div id="logo-search-container">--%>
<%--            <div id="logo">--%>
<%--                <a href="/">--%>
<%--                    <img src="http://placehold.co/180x100">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="search-bar">--%>
<%--                <form action="searchResult.jsp" method="get">--%>
<%--                    <input type="text" name="query" placeholder="검색어를 입력하세요" required>--%>
<%--                    <button type="submit" class="search-btn" onclick="toggleSearchIcon(this)">--%>
<%--                        <i class="fi fi-rr-search"></i>--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </header>--%>

<%--    <!-- gnb 메뉴 -->--%>
<%--    <div class="gnb">--%>
<%--        <a href="javascript:void(0);" id="categoryMenuBtn">--%>
<%--            <i class="fi fi-rr-align-justify"></i>--%>
<%--        </a>--%>
<%--        <div id="categoryMenu">--%>
<%--            <a href="category?category=11">카테고리 11</a>--%>
<%--            <a href="category?category=12">카테고리 12</a>--%>
<%--            <a href="category?category=13">카테고리 13</a>--%>
<%--        </div>--%>
<%--        <a href="mypage">마이페이지</a>--%>
<%--        <a href="heart"><i class="fi fi-rr-heart"></i></a>--%>
<%--    </div>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/member.js"></script>
    <link rel="stylesheet" href="/css/header_footer.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/product.css" />
    <link rel="stylesheet" href="/css/section.css" />
    <link rel="stylesheet" href="/css/loginForm.css" />
    <link rel="stylesheet" href="/css/mypage.css" />
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <script type="text/javascript">
        $(document).ready(function() {
            // 카테고리 버튼 클릭 시 메뉴 토글
            $('#categoryMenuBtn').click(function() {
                $('#categoryMenu').toggle();
            });

            // 메뉴 밖을 클릭하면 메뉴 닫기
            $(document).click(function(event) {
                if (!$(event.target).closest('#categoryMenu, #categoryMenuBtn').length) {
                    $('#categoryMenu').hide();
                }
            });
        });
    </script>
</head>
<body>
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
                    <a href="#">${loginUser.name}(${loginUser.id})</a>
                    <a href="logout">로그아웃</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 로고와 검색창 -->
    <div class="header-color">
        <header>
            <div id="logo-search-container">
                <div id="logo">
                    <a href="/">
                        <img src="http://placehold.co/180x100" alt="로고">
                    </a>
                </div>
                <div class="search-bar">
                    <form action="searchResult.jsp" method="get">
                        <input type="text" name="query" placeholder="검색어를 입력하세요" required>
                        <button type="submit" class="search-btn" onclick="toggleSearchIcon(this)">
                            <i class="fi fi-rr-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </header>

        <!-- gnb 메뉴 -->
        <div class="gnb">
            <div class="left">
                <a href="javascript:void(0);" id="categoryMenuBtn">
                    <i class="fi fi-rr-align-justify"></i>
                </a>
                <div id="categoryMenu">
                    <a href="category?category=11">카테고리 11</a>
                    <a href="category?category=12">카테고리 12</a>
                    <a href="category?category=13">카테고리 13</a>
                </div>
            </div>
            <div class="right">
                <a href="mypage"><i class="fi fi-rr-circle-user"></i></a>
                <a href="heart"><i class="fi fi-rr-heart"></i></a>
            </div>
        </div>
