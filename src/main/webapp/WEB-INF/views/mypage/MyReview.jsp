<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-review-container">
    <!-- 사이드바 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 콘텐츠 -->
    <section class="mypage-review-content">
        <h1 class="section-title">내가 쓴 리뷰</h1>
        <ul class="mypage-review-list">
            <c:forEach items="${MyReview}" var="review">
                <li class="mypage-review-item" onclick="toggleReviewContent(this)" id="review-${review.revseq}">
                    <!-- 이미지 및 리뷰 제목 -->
                    <div class="review-summary">
                        <div class="review-image">
                            <img src="${not empty review.rev_img ? review.rev_img : '/images/default-rev_img.png'}" alt="리뷰 이미지">
                        </div>
                        <div class="review-title">
                            <h3>${review.title}</h3>
                            <span class="review-date">${review.indate}</span>
                        </div>
                        <!-- 삭제 버튼 -->
                        <div class="review-actions">
                            <button class="delete-btn" onclick="deleteReview(event, '${review.revseq}')">삭제</button>
                        </div>
                    </div>
                    <!-- 드롭다운 리뷰 내용 -->
                    <div class="review-content">
                        <p>${review.content}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </section>
</div>

<script>
    // 드롭다운 기능 구현
    function toggleReviewContent(element) {
        const content = element.querySelector('.review-content');
        content.style.display = (content.style.display === 'block') ? 'none' : 'block';
    }
    // 리뷰 삭제 기능
    function deleteReview(event, id) {
        event.stopPropagation(); // 부모 이벤트 방지
        if (confirm("정말로 이 리뷰를 삭제하시겠습니까?")) {
            fetch('/review/delete?id='+id, {
                method: 'POST',
            })
                .then(response => response.text()) // 서버 응답을 문자열로 읽음
                .then(result => {
                    if (result === "success") {
                        alert("리뷰가 삭제되었습니다.");
                        document.getElementById('review-'+id).remove(); // DOM에서 항목 제거
                    } else {
                        alert("리뷰 삭제에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                });
        }
    }


</script>


<%@ include file="../footer.jsp" %>
