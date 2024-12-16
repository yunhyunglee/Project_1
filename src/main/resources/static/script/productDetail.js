// productDetail.js
// 찜하기 버튼 토글

function toggleHeart(button,cseq,loginUser) {
    //ajax로 로그인 확인/ 찜 목록 조회
    // 찜에 있으면 하트 지우고 찜
    if(loginUser==='null'||loginUser==='') {
        var ans=confirm("로그인해야 찜할 수 있습니다. 로그인하시겠습니까?");
        if(ans){location.href="loginForm"}
    }else {
        $.ajax({
            url: "toggleHeart",
            data: { cseq : cseq },
            method: "get",
            success: function (result) {
                const icon = button?.querySelector("i");
                if (!icon) {
                    console.error("Icon element not found.");
                    return;
                }
                if (result.zzim) {
                    icon.classList.remove("fi-rs-heart");
                    icon.classList.add("fi-ss-heart");
                } else {
                    icon.classList.remove("fi-ss-heart");
                    icon.classList.add("fi-rs-heart");
                }
                // 클릭 애니메이션
                button.classList.add("clicked");
                setTimeout(() => button.classList.remove("clicked"), 200);
            },
            error: function () {
                alert("일반 회원만 가능합니다.");
            }
        });
    }
}

// 상품 상세 설명 펼치기/접기
function toggleDescription() {
    // const description = document.querySelector(".description-content");
    // const button = document.querySelector(".toggle-description");
    //
    // if (!description || !button) {
    //     console.error("Description or button element not found.");
    //     return;
    // }
    //
    // const icon = button.querySelector("i");
    // description.classList.toggle("show");
    // button.classList.toggle("active");
    //
    // if (description.classList.contains("show")) {
    //     icon.classList.remove("fi-rr-angle-down");
    //     icon.classList.add("fi-rr-angle-up");
    // } else {
    //     icon.classList.remove("fi-rr-angle-up");
    //     icon.classList.add("fi-rr-angle-down");
    // }
}


function    closeContactForm() {
    const popup = document.getElementById('contactFormPopup');
    if (popup) {
        popup.classList.remove('active');
    } else {
        console.error('Contact form popup not found.');
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const popup = document.getElementById('productOptionsPopup');
    const enrollBtn = document.querySelector('.enroll-btn');
    const closeBtn = popup?.querySelector('.close-btn');

    if (enrollBtn && popup) {
        enrollBtn.addEventListener('click', function () {
            popup.style.display = 'block';
        });
    } else {
        console.error('Popup or enroll button not found.');
    }

    if (closeBtn) {
        closeBtn.addEventListener('click', function () {
            popup.style.display = 'none';
        });
    }
    const submitbtn = document.querySelector('.submit-btn');
    submitbtn.addEventListener('click', function () {
        const loginUser=$(this).data('id');
        if(loginUser==='null'||loginUser==='') {
            var ans=confirm("일반이용자만 참여할 수 있습니다. 로그인하시겠습니까?");
            if(ans){location.href="logout"}
        }else {
            const selectOption = document.getElementById('option2').value;
            if(selectOption==='') {
                alert("예약시간을 선택해야 합니다");
            }else {
                $('#productOptionsForm').submit();
            }

        }
    });
    const selectOption = document.getElementById('option2');
    selectOption.addEventListener('change', function () {
        const time = this.value;
        const day =$('#selectedday').val();
        $.ajax({
            url: "able-capacity",
            data: {
                day : day,
                time : time
            },
            method: "get",
            success: function (result) {
                $('#able-people').text(result+"/"+$('#able-people').data('max'));
            },
            error: function () {}
        });
    });

    // 폼 제출 이벤트 처리
    // const form = document.getElementById('productOptionsForm');
    // if (form) {
    //     form.addEventListener('submit', function (event) {
    //         event.preventDefault(); // 기본 제출 방지
    //         alert('선택한 옵션이 제출되었습니다.');
    //         popup.style.display = 'none'; // 팝업 닫기
    //     });
    // }
    // const submitBtn = document.querySelector('.submit-btn');
    // if (submitBtn) {
    //     closeBtn.addEventListener('click', function () {
    //         popup.style.display = 'none';
    //     });
    // }


    document.querySelector(".toggle-description")?.addEventListener("click", toggleDescription);
    document.querySelector(".toggle-title")?.addEventListener("click", togglePolicy);
});

// 환불 정책 더보기/접기
function togglePolicy() {
    const policyContent = document.querySelector('.policy-content');
    const toggleBtn = document.querySelector('.toggle-btn');

    if (policyContent.style.display === 'none' || policyContent.style.display === '') {
        policyContent.style.display = 'block'; // 내용을 표시
        toggleBtn.textContent = '접기'; // 버튼 텍스트 변경
    } else {
        policyContent.style.display = 'none'; // 내용을 숨김
        toggleBtn.textContent = '더보기'; // 버튼 텍스트 변경
    }
}

$(".review-content").each(function () {
    const content = $(this).text();
    if (content.length > 100) {
        $(this).html(content.substring(0, 100) + '<span class="more">... 더보기</span>');
        $(this).on("click", ".more", function () {
            $(this).parent().text(content);
        });
    }
});


// 문의하기 팝업 열기/닫기
function toggleContactForm() {
    const popup = document.getElementById('contactFormPopup');
    if (popup) {
        popup.classList.toggle('active');
    } else {
        console.error('Contact form popup not found.');
    }
}

