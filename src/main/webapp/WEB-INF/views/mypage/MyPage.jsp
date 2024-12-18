
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="content">
        <h2>마이페이지</h2>
         <c:choose>
            <c:when test="${usertype == 1}">
                <!-- 개인회원 본문 내용 -->
                <h3>${loginUser.name}님, 환영합니다!</h3>
                <p>여기에는 개인회원 관련 정보를 표시합니다.</p>
            </c:when>
            <c:otherwise>
                <!-- 사업자회원 본문 내용 -->
                <h3>${loginUser.name}님, 환영합니다!</h3>
                <p>여기에는 사업자회원 관련 정보를 표시합니다.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>


<%@ include file="../footer.jsp" %>
