<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<form method="POST" action="/deleteUser">--%>
<%--  <div>--%>
<%--    <label>id</label>    <input type="text" name="id" value="${dto.id}" readonly>--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>비밀번호</label>    <input type="password" name="pwd">--%>
<%--  </div>--%>

<%--  <div>${message}</div>--%>

<%--  <div>--%>
<%--    <input type="submit" value="탈퇴"> <input type="button" onclick="location.href='/'" value="되돌아가기">--%>
<%--  </div>--%>
<%--</form>--%>

<%--<%@ include file="../footer.jsp" %>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<div class="mypage-delete-container">--%>
<%--    <!-- 사이드바 포함 -->--%>
<%--    <jsp:include page="../sidebar.jsp" />--%>

<%--    <!-- 본문 -->--%>
<%--    <div class="mypage-delete-content">--%>
<%--        <h2 class="mypage-delete-title">회원 탈퇴</h2>--%>
<%--        <p class="mypage-delete-description">회원 탈퇴를 위해 비밀번호를 입력해 주세요.</p>--%>

<%--        <form class="mypage-delete-form" method="POST" action="/deleteUser" onsubmit="return openConfirmationModal();">--%>
<%--            <!-- 아이디 필드 -->--%>
<%--            <div class="mypage-delete-form-group">--%>
<%--                <label for="id" class="mypage-delete-form-label">아이디</label>--%>
<%--                <input type="text" id="id" name="id" value="${dto.id}" class="mypage-delete-form-input" readonly>--%>
<%--            </div>--%>

<%--            <!-- 비밀번호 필드 -->--%>
<%--            <div class="mypage-delete-form-group">--%>
<%--                <label for="pwd" class="mypage-delete-form-label">비밀번호</label>--%>
<%--                <input type="password" id="pwd" name="pwd" class="mypage-delete-form-input" placeholder="비밀번호를 입력하세요" required>--%>
<%--            </div>--%>

<%--            <!-- 에러 메시지 -->--%>
<%--            <c:if test="${not empty message}">--%>
<%--                <div class="mypage-delete-error-message">${message}</div>--%>
<%--            </c:if>--%>

<%--            <!-- 버튼 영역 -->--%>
<%--            <div class="mypage-delete-actions">--%>
<%--                <input type="submit" value="탈퇴" class="mypage-delete-btn-primary">--%>
<%--                <input type="button" onclick="location.href='/'" value="되돌아가기" class="mypage-delete-btn-secondary">--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- 확인 모달 -->--%>
<%--<div id="confirmationModal" class="mypage-delete-modal">--%>
<%--    <div class="mypage-delete-modal-content">--%>
<%--        <p class="mypage-delete-modal-message">정말로 탈퇴를 진행하시겠습니까?</p>--%>
<%--        <div class="mypage-delete-modal-actions">--%>
<%--            <button id="confirmYes" class="mypage-delete-modal-btn-yes">예</button>--%>
<%--            <button id="confirmNo" class="mypage-delete-modal-btn-no" onclick="closeModal()">아니오</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    // 모달 열기--%>
<%--    function openConfirmationModal() {--%>
<%--        const modal = document.getElementById('confirmationModal');--%>
<%--        modal.style.display = 'block';--%>
<%--        return false; // 폼 제출 중단--%>
<%--    }--%>

<%--    // 모달 닫기--%>
<%--    function closeModal() {--%>
<%--        document.getElementById('confirmationModal').style.display = 'none';--%>
<%--    }--%>

<%--    // 탈퇴 진행--%>
<%--    document.getElementById('confirmYes').addEventListener('click', function () {--%>
<%--        document.querySelector('.mypage-delete-form').submit();--%>
<%--    });--%>
<%--</script>--%>

<%--<%@ include file="../footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-delete-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="mypage-delete-content">
        <h2 class="mypage-delete-title">회원 탈퇴</h2>
        <p class="mypage-delete-description">회원 탈퇴를 위해 비밀번호를 입력해 주세요.</p>

        <form id="deleteForm" class="mypage-delete-form" method="POST" action="/deleteUser">
            <!-- 아이디 필드 -->
            <div class="mypage-delete-form-group">
                <label for="id" class="mypage-delete-form-label">아이디</label>
                <input type="text" id="id" name="id" value="${dto.id}" class="mypage-delete-form-input" readonly>
            </div>

            <!-- 비밀번호 필드 -->
            <div class="mypage-delete-form-group">
                <label for="pwd" class="mypage-delete-form-label">비밀번호</label>
                <input type="password" id="pwd" name="pwd" class="mypage-delete-form-input" placeholder="비밀번호를 입력하세요" required>
            </div>

            <!-- 에러 메시지 -->
            <c:if test="${not empty message}">
                <div class="mypage-delete-error-message">${message}</div>
            </c:if>

            <!-- 버튼 영역 -->
            <div class="mypage-delete-actions">
                <input type="button" value="탈퇴" class="mypage-delete-btn-primary" onclick="openModal()">
                <input type="button" onclick="location.href='/'" value="되돌아가기" class="mypage-delete-btn-secondary">
            </div>
        </form>
    </div>
</div>

<!-- 확인 모달 -->
<div id="confirmationModal" class="mypage-delete-modal">
    <div class="mypage-delete-modal-content">
        <p class="mypage-delete-modal-message">정말로 탈퇴를 진행하시겠습니까?</p>
        <div class="mypage-delete-modal-actions">
            <button class="mypage-delete-modal-btn-yes" onclick="proceedDeletion()">예</button>
            <button class="mypage-delete-modal-btn-no" onclick="closeModal()">아니오</button>
        </div>
    </div>
</div>

<script>
    // 모달 열기
    function openModal() {
        document.getElementById("confirmationModal").style.display = "flex";
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById("confirmationModal").style.display = "none";
    }

    // 폼 제출 처리
    function proceedDeletion() {
        document.getElementById("deleteForm").submit();
    }
</script>

<%@ include file="../footer.jsp" %>
