<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/script/admin-notice.js"></script>
<h2>공지사항 관리</h2>


<!-- 공지 추가 버튼 -->
<a class="add-notice-btn" onclick="openAddNoticeModal()">+ 공지 추가</a>

<div class="accordion-container">
    <c:forEach var="notice" items="${noticeList}">
        <div class="accordion-item">
            <!-- 제목 클릭 시 펼쳐지기 -->
            <div class="accordion-header" onclick="toggleAccordion(this)">
                <span>${notice.nseq}. ${notice.title}</span>
            </div>
            <div class="accordion-content">
                <!-- 펼쳐진 내용 -->
                <p><b>공지사항 제목:</b> ${notice.title}</p>
                <p><b>작성일:</b> ${notice.indate}</p>
                <p><b>본문 내용:</b> ${notice.content}</p>
                <div class="actions">
                    <button onclick="editNotice('${notice.nseq}')">수정</button>
                    <button onclick="deleteNotice('${notice.nseq}')">삭제</button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<!-- 수정 모달 -->
<div id="noticeEditModal" class="modal notice-modal">
    <div class="modal-content">
        <form id="noticeEditForm">
            <input type="hidden" id="noticeId" name="nseq">
            <div class="form-group">
                <label for="noticeTitle">제목</label>
                <input type="text" id="noticeTitle" name="title" required>
            </div>
            <div class="form-group">
                <label for="noticeContent">내용</label>
                <textarea id="noticeContent" name="content" required></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn cancel-btn" onclick="closeEditModal('noticeEditModal')">취소</button>
                <button type="button" class="btn save-btn" onclick="submitNoticeEditForm()">저장</button>
            </div>
        </form>
    </div>
</div>

<!-- 추가 모달 -->
<div id="addNoticeModal" class="modal notice-modal">
    <div class="modal-content">
        <form id="addNoticeForm">
            <div class="form-group">
                <label for="addNoticeTitle">제목</label>
                <input type="text" id="addNoticeTitle" name="title" required>
            </div>
            <div class="form-group">
                <label for="addNoticeContent">내용</label>
                <textarea id="addNoticeContent" name="content" required></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn cancel-btn" onclick="closeEditModal('addNoticeModal')">취소</button>
                <button type="button" class="btn add-btn" onclick="submitAddNoticeForm()">추가</button>
            </div>
        </form>
    </div>
</div>
