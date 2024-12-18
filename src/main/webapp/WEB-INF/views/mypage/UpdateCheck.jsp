<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-update-check-container">
    <!-- 사이드바 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 메인 콘텐츠 -->
    <div class="mypage-update-check-content">
        <h2 class="check-section-title">비밀번호 확인</h2>
        <p class="check-description">회원 정보수정을 위해 비밀번호를 입력해 주세요.</p>

        <!-- 비밀번호 확인 폼 -->
        <form method="post" action="updatecheck" class="mypage-update-check-form">
            <!-- 아이디 입력 필드 -->
            <div class="mypage-update-check-form-group">
                <label for="id" class="mypage-update-check-form-label">아이디</label>
                <input type="text" id="id" name="id" class="mypage-update-check-form-input" value="${loginUser.id}" readonly>
            </div>

            <!-- 비밀번호 입력 필드 -->
            <div class="mypage-update-check-form-group">
                <label for="pwd" class="mypage-update-check-form-label">비밀번호</label>
                <input type="password" id="pwd" name="pwd" class="mypage-update-check-form-input" placeholder="비밀번호를 입력하세요" required>
            </div>

            <!-- 에러 메시지 -->
            <c:if test="${not empty message}">
                <div class="mypage-update-error-message">${message}</div>
            </c:if>

            <!-- 버튼 영역 -->
            <div class="mypage-update-check-form-actions">
                <input type="submit" value="확인" class="mypage-update-check-btn-primary">
                <input type="button" value="취소" class="mypage-update-check-btn-secondary" onclick="location.href='/mypage'">
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>
