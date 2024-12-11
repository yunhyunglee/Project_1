<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<head>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@flaticon/font@5.0.0/css/font.css">--%>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-straight/css/uicons-solid-straight.css'>
    <script src="script/productDetail.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">--%>
</head>

<section class="product-detail">
    <!-- 상품 이미지 섹션 -->
    <div class="product-image">
<%--        <img src="/images/${product.image}" alt="${product.title}" />--%>
        <img src="http://placehold.co/300x300">
    </div>

    <!-- 상품 정보 섹션 -->
    <div class="product-info">
        <h3>${productVo.title}</h3>
        <p>${productVo.address1}, ${productVo.address2}, ${productVo.address3}</p>
        <p class="price">${productVo.price}원</p>
<%--        <p class="description">${product.description}</p>--%>
        <p class="description">${productVo.content}</p>
        <p><strong>최대 수용인원 : </strong> ${productVo.max_people}</p>
        <div class="button-group">
            <button class="enroll-btn">신청하기</button>
            <!-- 찜하기 버튼 -->
            <button class="wishlist-btn" onclick="toggleHeart(this)">
                <i class="fi fi-rs-heart"></i> <!-- 빈 하트 아이콘 -->
            </button>
        </div>
    </div>
</section>

<!-- 상품 상세설명 섹션 -->
<section class="product-description">
    <h3>상품 상세 설명</h3>
    <button class="toggle-description">
        <i class="fi fi-rr-angle-down"></i>
    </button>
    <div class="description-content">
        <p>${product.detailedDescription}</p>
    </div>
</section>

<!-- 후기 섹션 -->
<section class="reviews">
    <h3>후기</h3>
    <button class="toggle-reviews">
        <i class="fi fi-rr-angle-down"></i>
    </button>
    <div class="review-list">
        <ul>
            <c:forEach var="review" items="${reviews}">
                <li>${review.author}: ${review.comment}</li>
            </c:forEach>
        </ul>
    </div>
</section>

<!-- 환불 정책 섹션 -->
<section class="return-policy">
    <h3 class="toggle-title">
        <span>변경 및 취소 정책</span>
        <i class="fi fi-rr-angle-down"></i>
    </h3>
    <div class="policy-content">
        <p> 1. 결제 후 14일 이내 취소 시 : 전액 환불<br>
            (단, 결제 후 14일 이내라도 호스트와 프립 진행일 예약 확정 후 환불 불가)<br>
            2. 결제 후 14일 이후 취소 시 : 환불 불가<br>
            ※ 상품의 유효기간 만료 시 연장은 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
            ※ 배송상품의 경우 배송 준비 전 전액 환불 가능, 배송 준비 후 환불 불가 합니다.<br>
            ※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
            [환불 신청 방법]<br>
            1. 해당 클래스를 결제한 계정으로 로그인<br>
            2. 마이페이지 - 예약내역 or 결제내역</p><br>
    </div>
</section>
<%--<!-- 지도 섹션 -->--%>
<%--<section class="location">--%>
<%--    <h3>위치</h3>--%>
<%--    <p>${product.location}</p>--%>
<%--    <div class="map">--%>
<%--        <div id="map-container"></div>--%>
<%--    </div>--%>
<%--</section>--%>

<!-- 문의하기 팝업 버튼 -->
<section class="contact-section">
    <button class="contact-btn" onclick="toggleContactForm()">문의하기</button>
</section>

<!-- 문의하기 팝업 폼 -->
<div class="popup-overlay" id="contactFormPopup">
    <div class="popup-content">
        <h3>문의하기</h3>
        <form id="contactForm">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" required>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required>

            <label for="message">내용</label>
            <textarea id="message" name="message" required></textarea>

            <button type="submit" class="submit-btn">전송하기</button>
        </form>
        <button class="close-btn" onclick="closeContactForm()"><i class="fi fi-rr-cross"></i></button> <!-- X 버튼 추가 -->
    </div>
</div>


<%@ include file="../footer.jsp" %>
