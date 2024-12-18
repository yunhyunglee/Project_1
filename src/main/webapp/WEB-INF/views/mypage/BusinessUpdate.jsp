
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<form method="POST" action="/updateBusiness">--%>
<%--    <div>--%>
<%--        <label>id</label>    <input type="text" name="id" value="${dto.id}" readonly>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label>비밀번호</label>    <input type="password" name="pwd">--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label>비밀번호 확인</label>    <input type="password" name="pwdchk">--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label>이름</label>    <input type="text" name="name" value="${dto.name}">--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label>E-mail</label>    <input type="text" name="email" value="${dto.email}">--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <label>전화번호</label>   <input type="text" name="phone" value="${dto.phone}">--%>
<%--    </div>--%>
<%--    <div>${message}</div>--%>

<%--    <div>--%>
<%--        <input type="submit" value="수정"> <input type="button" onclick="location.href='/'" value="되돌아가기">--%>
<%--    </div>--%>
<%--</form>--%>

<%--<%@ include file="../footer.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="business-update-container">
    <!-- 사이드바 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="business-update-content">
        <h2 class="business-update-title">사업자 정보 수정</h2>
        <p class="business-update-description">사업자 정보를 수정합니다.</p>

        <form method="POST" action="/updateBusiness" class="business-update-form">
            <!-- 아이디 필드 -->
            <div class="business-update-form-group">
                <label for="id" class="business-update-form-label">ID</label>
                <input type="text" name="id" id="id" value="${dto.id}" class="business-update-form-input" readonly>
            </div>

            <!-- 비밀번호 필드 -->
            <div class="business-update-form-group">
                <label for="pwd" class="business-update-form-label">비밀번호</label>
                <input type="password" name="pwd" id="pwd" class="business-update-form-input">
            </div>

            <!-- 비밀번호 확인 필드 -->
            <div class="business-update-form-group">
                <label for="pwdchk" class="business-update-form-label">비밀번호 확인</label>
                <input type="password" name="pwdchk" id="pwdchk" class="business-update-form-input">
            </div>

            <!-- 이름 필드 -->
            <div class="business-update-form-group">
                <label for="name" class="business-update-form-label">이름</label>
                <input type="text" name="name" id="name" value="${dto.name}" class="business-update-form-input">
            </div>

            <!-- 이메일 필드 -->
            <div class="business-update-form-group">
                <label for="email" class="business-update-form-label">E-mail</label>
                <input type="text" name="email" id="email" value="${dto.email}" class="business-update-form-input">
            </div>

            <!-- 전화번호 필드 -->
            <div class="business-update-form-group">
                <label for="phone" class="business-update-form-label">전화번호</label>
                <input type="text" name="phone" id="phone" value="${dto.phone}" class="business-update-form-input">
            </div>

            <!-- 에러 메시지 -->
            <c:if test="${not empty message}">
                <div class="business-update-error-message">${message}</div>
            </c:if>

            <!-- 버튼 영역 -->
            <div class="business-update-actions">
                <input type="submit" value="수정" class="business-update-btn-primary">
                <input type="button" onclick="history.back()" value="되돌아가기" class="business-update-btn-secondary">
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>

