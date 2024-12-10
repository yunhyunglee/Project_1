<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../customer_header.jsp" %>

<script src="/script/customer.js"></script>

<div id="wrap">
<%--<header>--%>

<%--    <div class="logo">오늘배움 고객센터</div>--%>
<%--    <div class="header-right">--%>
<%--        <a href="/">메인으로</a>--%>
<%--    </div>--%>
<%--</header>--%>
    <main>
        <section class="main-banner">
            <h1>고객센터<br>무엇을 도와드릴까요?</h1>
            <div class="cus-search-bar">
                <input type="text" placeholder=" 검색ㄱㄱ">
                <button>검색</button>
            </div>
            <div class="keyword">
                <span>추천 키워드</span>
                <a href="#">비밀번호 변경</a>
                <a href="#">클래스 예약날짜 변경</a>
                <a href="#">환불처리</a>
            </div>
        </section>
        <section class="question">
            <div class="question-bar" onclick="toggleFAQ()">
                <h3>자주 묻는 질문</h3>
                <span class="arrow">▼</span>
            </div>
            <ul class="question-list" id="questionList">
                <li><a href="#">회원 가입은 어떻게 하나요?</a></li>
                <li><a href="#">비밀번호를 잊어버렸어요.</a></li>
                <li><a href="#">계정을 삭제하고 싶어요.</a></li>
                <li><a href="#">예약 날짜를 변경하고 싶어요.</a></li>
            </ul>
        </section>
    </main>
</div>

<%@ include file="../footer.jsp" %>
