// productDetail.js
// 찜하기 버튼 토글
function toggleHeart(button,cseq,loginUser) {
    //ajax로 로그인 확인/ 찜 목록 조회
    // 찜에 있으면 하트 지우고 찜
    if(loginUser=='null'||loginUser=='') {
        var ans=confirm("로그인해야 찜할 수 있습니다. 로그인하시겠습니까?");
        if(ans){location.href="loginForm"}
    }else {
        $.ajax({
            url: "toggleHeart",
            data: { cseq : cseq },
            method: "get",
            success: function (result) {
                const icon = button.querySelector("i");
                if (result.zzim) {
                    // icon.classList.remove("fa-heart-o");
                    // icon.classList.add("fa-heart");
                    icon.classList.remove("fi-rs-heart"); // 빈 하트 제거
                    icon.classList.add("fi-ss-heart");   // 채워진 하트 추가
                } else {
                    // icon.classList.remove("fa-heart");
                    // icon.classList.add("fa-heart-o");
                    icon.classList.remove("fi-ss-heart"); // 채워진 하트 제거
                    icon.classList.add("fi-rs-heart");    // 빈 하트 추가
                }
            },
            error: function () {
                alert("실패");
            }
        });
    }
    // const icon = button.querySelector("i");
    //
    // // 현재 아이콘이 빈 하트인지 확인하고 채워진 하트로 전환
    // if (icon.classList.contains("fi-rs-heart")) {
    //     icon.classList.remove("fi-rs-heart"); // 빈 하트 제거
    //     icon.classList.add("fi-ss-heart");   // 채워진 하트 추가
    // } else {
    //     icon.classList.remove("fi-ss-heart"); // 채워진 하트 제거
    //     icon.classList.add("fi-rs-heart");    // 빈 하트 추가
    // }
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

// // 초기화 시 각 버튼에 클릭 이벤트 연결
// document.addEventListener("DOMContentLoaded", function () {
//     document.querySelector(".toggle-description").addEventListener("click", toggleDescription);
//     document.querySelector(".toggle-reviews").addEventListener("click", toggleReviews);
//     document.querySelector(".toggle-title").addEventListener("click", togglePolicy);
// });


// 문의하기 팝업 열기
function toggleContactForm() {
    const popup = document.getElementById('contactFormPopup');
    popup.classList.toggle('active'); // 팝업 활성화/비활성화
}

// 문의하기 팝업 닫기
function closeContactForm() {
    document.getElementById('contactFormPopup').classList.remove('active'); // 팝업 닫기
}

