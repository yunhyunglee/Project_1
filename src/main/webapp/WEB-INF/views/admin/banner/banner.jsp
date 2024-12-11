<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/script/admin-business.js"></script>

<h2>배너 관리</h2>

<button onclick="openAddBannerModal()">배너 추가</button>

<div class="accordion-container">
    <c:forEach var="banner" items="${bannerList}">
        <div class="accordion-item">
            <div class="accordion-header" onclick="toggleAccordion(this)">
                <span>${banner.title}</span>
            </div>
            <div class="accordion-content">
                <img src="${banner.image}" alt="${banner.title}" width="200px" />
                <p><b>내용:</b> ${banner.content}</p>
                <p><b>링크:</b> <a href="${banner.link}" target="_blank">${banner.link}</a></p>
                <p><b>우선순위:</b> ${banner.priority}</p>
                <p><b>활성화:</b> ${banner.active ? 'Yes' : 'No'}</p>
                <div class="actions">
                    <button onclick="editBanner(${banner.bannerId})">수정</button>
                    <button onclick="deleteBanner(${banner.bannerId})">삭제</button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div id="bannerEditModal" class="modal">
    <div class="modal-content">
        <form id="bannerEditForm">
            <input type="hidden" id="bannerId" name="bannerId">
            <div class="form-group">
                <label for="bannerTitle">제목</label>
                <input type="text" id="bannerTitle" name="title" required>
            </div>
            <div class="form-group">
                <label for="bannerImage">이미지 URL</label>
                <input type="text" id="bannerImage" name="image" required>
            </div>
            <div class="form-group">
                <label for="bannerContent">내용</label>
                <textarea id="bannerContent" name="content" required></textarea>
            </div>
            <div class="form-group">
                <label for="bannerLink">링크</label>
                <input type="text" id="bannerLink" name="link" required>
            </div>
            <div class="form-group">
                <label for="bannerPriority">우선순위</label>
                <input type="number" id="bannerPriority" name="priority" required>
            </div>
            <div class="form-group">
                <label for="bannerActive">활성화</label>
                <input type="checkbox" id="bannerActive" name="active">
            </div>
            <div class="modal-footer">
                <button type="button" onclick="closeEditModal('bannerEditModal')">취소</button>
                <button type="button" onclick="submitBannerEditForm()">저장</button>
            </div>
        </form>
    </div>
</div>

<div id="bannerAddModal" class="modal">
    <div class="modal-content">
        <form id="bannerAddForm">
            <div class="form-group">
                <label for="addBannerTitle">제목</label>
                <input type="text" id="addBannerTitle" name="title" required>
            </div>
            <div class="form-group">
                <label for="addBannerImage">이미지 URL</label>
                <input type="text" id="addBannerImage" name="image" required>
            </div>
            <div class="form-group">
                <label for="addBannerContent">내용</label>
                <textarea id="addBannerContent" name="content" required></textarea>
            </div>
            <div class="form-group">
                <label for="addBannerLink">링크</label>
                <input type="text" id="addBannerLink" name="link" required>
            </div>
            <div class="form-group">
                <label for="addBannerPriority">우선순위</label>
                <input type="number" id="addBannerPriority" name="priority" required>
            </div>
            <div class="form-group">
                <label for="addBannerActive">활성화</label>
                <input type="checkbox" id="addBannerActive" name="active">
            </div>
            <div class="modal-footer">
                <button type="button" onclick="closeEditModal('bannerAddModal')">취소</button>
                <button type="button" onclick="submitAddBannerForm()">추가</button>
            </div>
        </form>
    </div>
</div>
