
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="content">
        <h2>내 마이페이지</h2>
        <c:choose>
            <c:when test="${user == 1}">
                <a href="updatecheck">회원정보 수정</a> <hr>
                <a href="ZZim">찜목록</a><hr>
                <a href="MyReview">내 후기목록</a><hr>
                <a href="MyReservation">내 예약내역</a><hr>
                <a href="myQna">qna</a><hr>
                <a href="deleteUserForm">탈퇴</a><hr>
            </c:when>
            <c:otherwise>
                <a href="updatecheck">회원정보 수정</a> <hr>
                <a href="MyClass">내 클래스 관리</a><hr>
                <a href="myQna">qna</a><hr>
                <a href="deleteUserForm">탈퇴</a><hr>
            </c:otherwise>
        </c:choose>
    </div>
</div>


<%@ include file="../footer.jsp" %>
