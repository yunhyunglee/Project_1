<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-update-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="mypage-update-content">
       <h2 class="section-title">회원 정보수정</h2>
       <p class="description">회원 정보수정를 수정합니다.</p>
        <form method="POST" action="/updateUser" class="mypage-update-form">
            <div class=mypage-update-form-group">
                <label for="id" class="mypage-form-label">ID</label>
                <input type="text" name="id" id="id" value="${dto.id}" readonly>
            </div>
            <div class=mypage-update-form-group">
                <label for="pwd" class="mypage-form-label">비밀번호</label>
                <input type="password" name="pwd" id="pwd">
            </div>
            <div class=mypage-update-form-group">
                <label for="pwdchk" class="mypage-form-label">비밀번호 확인</label>
                <input type="password" name="pwdchk" id="pwdchk">
            </div>
            <div class=mypage-update-form-group">
                <label for="name" class="mypage-form-label">이름</label>
                <input type="text" name="name" id="name" value="${dto.name}">
            </div>
            <div class=mypage-update-form-group">
                <label for="email" class="mypage-form-label">E-mail</label>
                <input type="text" name="email" id="email" value="${dto.email}">
            </div>
            <div class=mypage-update-form-group">
                <label for="phone" class="mypage-form-label">전화번호</label>
                <input type="text" name="phone" id="phone" value="${dto.phone}">
            </div>
            <div class="update-error-message">${message}</div>

            <div class="mypage-form-actions">
                <input type="submit" value="수정" class="btn-primary" >
                <input type="button" onclick="history.back()" value="되돌아가기" class="btn-secondary">
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp" %>
