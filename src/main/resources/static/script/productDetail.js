// productDetail.js
// 찜하기 버튼 토글
function toggleHeart(button) {
    const icon = button.querySelector("i");
    icon.classList.toggle("fa-heart-o");  // 빈 하트 -> 채워진 하트로 전환
    icon.classList.toggle("fa-heart");    // 채워진 하트 -> 빈 하트로 전환
}

// 상품 상세 설명 펼치기/접기
function toggleDescription() {
    const description = document.querySelector(".description-content");
    const button = document.querySelector(".toggle-description");
    const icon = button.querySelector("i");

    description.classList.toggle("show"); // 내용을 펼치거나 접음
    button.classList.toggle("active"); // 아이콘 전환

    // 아이콘 변경
    if (description.classList.contains("show")) {
        icon.classList.remove("fi-rr-angle-down");
        icon.classList.add("fi-rr-angle-up");
    } else {
        icon.classList.remove("fi-rr-angle-up");
        icon.classList.add("fi-rr-angle-down");
    }
}

// 후기 펼치기/접기
function toggleReviews() {
    const reviews = document.querySelector(".review-list");
    const button = document.querySelector(".toggle-reviews");
    const icon = button.querySelector("i");

    reviews.classList.toggle("show"); // 내용을 펼치거나 접음
    button.classList.toggle("active"); // 아이콘 전환

    // 아이콘 변경
    if (reviews.classList.contains("show")) {
        icon.classList.remove("fi-rr-angle-down");
        icon.classList.add("fi-rr-angle-up");
    } else {
        icon.classList.remove("fi-rr-angle-up");
        icon.classList.add("fi-rr-angle-down");
    }
}

// 환불 정책 펼치기/접기
function togglePolicy() {
    const policyContent = document.querySelector(".policy-content");
    const button = document.querySelector(".toggle-title");
    const icon = button.querySelector("i");

    policyContent.classList.toggle("show"); // 내용을 펼치거나 접음
    button.classList.toggle("active"); // 아이콘 전환

    // 아이콘 변경
    if (policyContent.classList.contains("show")) {
        icon.classList.remove("fi-rr-angle-down");
        icon.classList.add("fi-rr-angle-up");
    } else {
        icon.classList.remove("fi-rr-angle-up");
        icon.classList.add("fi-rr-angle-down");
    }
}

// 초기화 시 각 버튼에 클릭 이벤트 연결
document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".toggle-description").addEventListener("click", toggleDescription);
    document.querySelector(".toggle-reviews").addEventListener("click", toggleReviews);
    document.querySelector(".toggle-title").addEventListener("click", togglePolicy);
});


// 문의하기 팝업 열기
function toggleContactForm() {
    const popup = document.getElementById('contactFormPopup');
    popup.classList.toggle('active'); // 팝업 활성화/비활성화
}

// 문의하기 팝업 닫기
function closeContactForm() {
    document.getElementById('contactFormPopup').classList.remove('active'); // 팝업 닫기
}

