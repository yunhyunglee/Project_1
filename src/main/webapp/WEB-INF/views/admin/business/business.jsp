<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">



<h2>사업자 관리</h2>


<div class="search-container">
    <input type="text" id="searchQueryBusiness" placeholder="사업자 정보 검색 (ID, 이름, 이메일)">
    <button onclick="filterItems('searchQueryBusiness', 'card')">검색</button>
</div>

<div class="card-container">
    <c:forEach var="business" items="${businessList}">
        <div class="card">
            <div class="card-title">사업자 ID: ${business.id}</div>
            <div class="card-content">
                <p><b>이름:</b> ${business.name}</p>
                <p hidden="hidden"><b>비밀번호:</b> ${business.pwd}</p>
                <p><b>전화번호:</b> ${business.phone}</p>
                <p><b>이메일:</b> ${business.email}</p>
            </div>
            <div class="card-actions">
                <button class="edit-btn" onclick="editBusiness('${business.id}')">수정</button>
                <button class="delete-btn" onclick="deleteBusiness('${business.id}')">삭제</button>
            </div>
        </div>
    </c:forEach>
</div>



<div id="businessEditModal" class="modal">
    <div class="modal-content">

        <div class="modal-header">
            <h2 id="modalTitle">회원 정보 수정</h2> <%-- 동적으로 수정 가능 --%>
            <span class="close-btn" onclick="closeEditModal('businessEditModal')">&times;</span>
        </div>
        <form id="businessEditForm" class="modal-body">
<%--            <input type="hidden" id="editBusinessId" name="id">--%>
            <div class="form-group">
                <label for="editBusinessId">아이디</label>
                <input type="text" id="editBusinessId" name="id" readonly>
            </div>
            <div class="form-group">
                <label for="editName">이름</label>
                <input type="text" id="editName" name="name" required>
            </div>
            <div class="form-group">
                <label for="editPhone">전화번호</label>
                <input type="text" id="editPhone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="editEmail">이메일</label>
                <input type="email" id="editEmail" name="email" required>
            </div>
            <div class="modal-footer">
                <button type="button"  class="btn cancel-btn" onclick="closeEditModal('businessEditModal')">취소</button>
                <button type="button" class="btn save-btn"  onclick="submitBusinessEditForm()">저장</button>
            </div>
        </form>
    </div>
</div>
