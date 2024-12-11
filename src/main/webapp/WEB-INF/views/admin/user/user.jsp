<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<script src="/script/admin-user.js"></script>
<h2>회원 관리</h2>

<div class="search-container">
    <input type="text" id="searchQuery" placeholder="회원 정보 검색 (ID, 이름, 이메일)">
    <button onclick="filterItems('searchQuery', 'card')">검색</button>
</div>

<div class="card-container">
    <c:forEach var="user" items="${userList}">
        <div class="card">
            <div class="card-title">회원 ID: ${user.id}</div>
            <div class="card-content">
                <p><b>이름:</b> ${user.name}</p>
                <p><b>이메일:</b> ${user.email}</p>
                <p><b>전화번호:</b> ${user.phone}</p>
                <p><b>가입일:</b> ${user.indate}</p>
            </div>
            <div class="card-actions">
                <button class="edit-btn" onclick="editUser('${user.id}')">수정</button>
                <button class="delete-btn" onclick="deleteUser('${user.id}')">삭제</button>
            </div>
        </div>
    </c:forEach>
</div>

<%-- 수정 폼 --%>
<div id="userEditModal" class="modal">
    <div class="modal-content">
        <!-- 모달 헤더 -->
        <div class="modal-header">
            <h2 id="modalTitle">회원 정보 수정</h2> <%-- 동적으로 수정 가능 --%>
            <span class="close-btn" onclick="closeEditModal('editModal')">&times;</span>
        </div>
        <!-- 모달 본문 -->
        <form id="userEditForm" class="modal-body">
            <div class="form-group">
                <label for="editUserId">아이디</label>
                <input type="text" id="editUserId" name="id" readonly>
            </div>
            <div class="form-group">
                <label for="editName">이름</label>
                <input type="text" id="editName" name="name" required>
            </div>
            <div class="form-group">
                <label for="editEmail">이메일</label>
                <input type="email" id="editEmail" name="email" required>
            </div>
            <div class="form-group">
                <label for="editPhone">전화번호</label>
                <input type="text" id="editPhone" name="phone" required>
            </div>
            <div class="form-group">

                <input type="hidden" id="editPwd" name="pwd">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn cancel-btn" onclick="closeEditModal('userEditModal')">취소</button>
                <button type="button" class="btn save-btn" onclick="submitUserEditForm()">저장</button>
            </div>
        </form>
    </div>
</div>
