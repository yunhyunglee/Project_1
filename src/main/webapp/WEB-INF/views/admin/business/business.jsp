<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">




<h2>사업자 관리</h2>
<div class="search-container">
<select id="searchType">
    <option value="id" ${searchType == 'id' ? 'selected' : ''}>ID</option>
    <option value="name" ${searchType == 'name' ? 'selected' : ''}>이름</option>
    <option value="email" ${searchType == 'email' ? 'selected' : ''}>이메일</option>
</select>
<input type="text" id="searchQuery" value="${searchQuery}" placeholder="검색어 입력">
<button onclick="searchBusiness()">검색</button>
</div>


<div class="card-container">
    <!-- 사업자 목록 반복 -->
    <c:forEach var="row" items="${businessList}">
        <div class="card">
            <!-- 사업자 정보 -->
            <div class="card-title">사업자 ID: ${row.id}</div>
            <div class="card-content">
                <p><b>이름:</b> ${row.name}</p>
                <p><b>전화번호:</b> ${row.phone}</p>
                <p><b>이메일:</b> ${row.email}</p>
            </div>

            <!-- 버튼 영역 -->
            <div class="card-actions">
                <!-- 수정 버튼 -->
                <button onclick="editBusiness('${row.id}')">수정</button>
                <!-- 삭제 버튼 -->
                <button onclick="deleteBusiness('${row.id}')">삭제</button>
                <!-- 상품 목록 로드 버튼 -->
                <button onclick="loadProductsForBusiness('${row.id}', 'product-list-${row.id}')">
                    상품 목록 로드
                </button>
            </div>

            <!-- 상품 목록 출력 -->
            <div id="product-list-${row.id}" class="product-list">
                <!-- 상품 목록이 로드되면 여기에 추가 -->
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

<!-- 페이징 링크 -->
<div class="pagination">
    <c:if test="${paging.prev}">
        <a href="#" onclick="goToPageB(${paging.beginPage - 1})">◀</a>
    </c:if>
    <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
        <a href="#" onclick="goToPageB(${index})" class="${index == paging.page ? 'active' : ''}">${index}</a>
    </c:forEach>
    <c:if test="${paging.next}">
        <a href="#" onclick="goToPageB(${paging.endPage + 1})">▶</a>
    </c:if>
</div>
