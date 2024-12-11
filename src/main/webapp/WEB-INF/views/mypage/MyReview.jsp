<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-review-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 콘텐츠 -->
    <section class="mypage-review-section">
        <article class="mypage-review-article">
            <div class="mypage-review-list">
                <c:forEach items="${MyReview}" var="review">
                    <div class="mypage-review-item">
                        <div class="mypage-review-header">
                            <h2 class="mypage-review-title">${review.title}</h2>
                            <span class="mypage-review-date">${review.date}</span> <!-- 리뷰 작성 날짜 -->
                        </div>
                        <div class="mypage-review-content">
                            <h3>${review.content}</h3>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </article>
    </section>
</div>

<%@ include file="../footer.jsp" %>
