<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="product-detail-page">
    <!-- 상단 섹션 -->
    <section class="top-section">
        <div class="product-image-slider">
            <img src="/product_images/${productVo.image}" alt="${productVo.title}" />
        </div>
        <div class="product-summary">
            <div class="text-info">
                <h1 class="product-title">${productVo.title}</h1>
                <p class="product-address">${productVo.address1}</p>
                <p class="price">${productVo.price}원</p>
            </div>
            <div class="productDetail-button-group">
                <button class="wishlist-btn" onclick="toggleHeart(this, ${productVo.cseq}, '${loginUser.id}')">
                    <c:choose>
                        <c:when test="${zzim eq true}">
                            <i class="fi fi-ss-heart"></i>
                        </c:when>
                        <c:otherwise>
                            <i class="fi fi-rs-heart"></i>
                        </c:otherwise>
                    </c:choose>
                </button>
                <button class="enroll-btn">참여하기</button>
            </div>
        </div>
    </section>

    <!-- 클래스 소개 및 주요 정보 -->
    <section class="product-info-section">
        <div class="item">
            <h2>클래스 소개</h2>
            <p>${productVo.content}</p>
        </div>
        <div class="item">
            <h3>진행 장소</h3>
            <div class="map">
                <div id="map-container"></div>
            </div>
        </div>
    </section>
    <section class="reviews">
        <h2>후기</h2>
<%--        <c:if test="${not empty reviews}">--%>
<%--            <ul class="review-list">--%>
<%--                <c:forEach var="review" items="${reviews}">--%>
<%--                    <li class="review-item">--%>
<%--                        <div class="review-header">--%>
<%--                            <span class="reviewer-name">--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${not empty review.userName}">${review.userName}</c:when>--%>
<%--                                    <c:otherwise>익명</c:otherwise>--%>
<%--                                </c:choose>--%>
<%--                            </span>--%>
<%--                            <span class="review-rating">--%>
<%--                                <c:forEach var="star" begin="1" end="5">--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${star <= review.rating}">--%>
<%--                                            <i class="fi fi-ts-star"></i>--%>
<%--                                        </c:when>--%>
<%--                                        <c:otherwise>--%>
<%--                                            <i class="fi fi-ts-star"></i>--%>
<%--                                        </c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                </c:forEach>--%>
<%--                            </span>--%>
<%--                            <span class="review-date">--%>
<%--                                <fmt:formatDate value="${review.indate}" pattern="yyyy-MM-dd HH:mm" />--%>
<%--                            </span>--%>
<%--                        </div>--%>
<%--                        <div class="review-content">--%>
<%--                            <p>${review.content}</p>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </c:forEach>--%>
<%--            </ul>--%>
<%--        </c:if>--%>
        <c:if test="${empty reviews}">
            <p>아직 등록된 후기가 없습니다.</p>
        </c:if>
    </section>

    <!-- 문의하기 -->
    <section class="reviews-and-questions">
        <div class="questions">
            <h2>문의하기</h2>
            <form id="contactForm">
                <textarea name="question" placeholder="문의 내용을 입력하세요" required></textarea>
                <button type="submit" class="submit-btn">문의하기</button>
            </form>
        </div>
    </section>

    <!-- 환불 정책 -->
    <section class="return-policy-section">
        <h2>환불 정책</h2>
        <div class="policy-summary">
            환불 및 변경 정책을 확인하세요.
        </div>
        <button class="toggle-btn" onclick="togglePolicy()">더보기</button>
        <div class="policy-content" style="display: none;">
            <p>
                1. 결제 후 14일 이내 취소 시 : 전액 환불<br>
                (단, 결제 후 14일 이내라도 호스트와 프립 진행일 예약 확정 후 환불 불가)<br>
                2. 결제 후 14일 이후 취소 시 : 환불 불가<br>
                ※ 상품의 유효기간 만료 시 연장은 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
                ※ 배송상품의 경우 배송 준비 전 전액 환불 가능, 배송 준비 후 환불 불가 합니다.<br>
                ※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
            </p>
        </div>
    </section>
</div>

<%--<!-- 고정 하단 버튼 -->--%>
<%--<div class="fixed-bottom">--%>
<%--    <button class="fixed-enroll-btn">신청하기</button>--%>
<%--</div>--%>

<%@ include file="../footer.jsp" %>
