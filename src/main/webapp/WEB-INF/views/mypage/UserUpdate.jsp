<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-update-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="mypage-update-content">
       <h2 class="update-section-title">회원 정보 수정</h2>
       <p class="update-description">회원 정보를 수정합니다.</p>

        <form method="POST" action="/updateUser" class="mypage-update-form">
            <!-- 아이디 필드 -->
            <div class="mypage-update-form-group">
                <label for="id" class="mypage-update-form-label">ID</label>
                <input type="text" name="id" id="id" value="${dto.id}" class="mypage-update-form-input" readonly>
            </div>

            <!-- 비밀번호 필드 -->
            <div class="mypage-update-form-group">
                <label for="pwd" class="mypage-update-form-label">비밀번호</label>
                <input type="password" name="pwd" id="pwd" class="mypage-update-form-input">
            </div>

            <!-- 비밀번호 확인 -->
            <div class="mypage-update-form-group">
                <label for="pwdchk" class="mypage-update-form-label">비밀번호 확인</label>
                <input type="password" name="pwdchk" id="pwdchk" class="mypage-update-form-input">
            </div>

            <!-- 이름 필드 -->
            <div class="mypage-update-form-group">
                <label for="name" class="mypage-update-form-label">이름</label>
                <input type="text" name="name" id="name" value="${dto.name}" class="mypage-update-form-input">
            </div>

            <!-- 이메일 필드 -->
            <div class="mypage-update-form-group">
                <label for="email" class="mypage-update-form-label">E-mail</label>
                <input type="text" name="email" id="email" value="${dto.email}" class="mypage-update-form-input">
            </div>

            <!-- 전화번호 필드 -->
            <div class="mypage-update-form-group">
                <label for="phone" class="mypage-update-form-label">전화번호</label>
                <input type="text" name="phone" id="phone" value="${dto.phone}" class="mypage-update-form-input">
            </div>

            <!-- 에러 메시지 -->
            <c:if test="${not empty message}">
                <div class="mypage-update-error-message">${message}</div>
            </c:if>

            <!-- 버튼 영역 -->
            <div class="mypage-update-actions">
                <input type="submit" value="수정" class="mypage-update-btn-primary">
                <input type="button" onclick="history.back()" value="되돌아가기" class="mypage-update-btn-secondary">
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>
