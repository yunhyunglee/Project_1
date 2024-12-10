// // header.js
//
// $(document).ready(function() {
//     // 카테고리 버튼 클릭 시 메뉴 토글
//     $('#categoryMenuBtn').click(function() {
//         $('#categoryMenu').toggle();
//     });
//
//     // 메뉴 밖을 클릭하면 메뉴 닫기
//     $(document).click(function(event) {
//         if (!$(event.target).closest('#categoryMenu, #categoryMenuBtn').length) {
//             $('#categoryMenu').hide();
//         }
//     });
//
//     // 하트 아이콘 클릭 시 로그인 여부에 따라 페이지 이동
//     $('.fi-rr-heart').click(function() {
//         if ($('.login-signup a').text().includes('로그인')) {
//             window.location.href = "loginForm"; // 로그인 화면으로 이동
//         } else {
//             window.location.href = "ZZim"; // 찜 목록 페이지로 이동
//         }
//     });
// });
//
// // 카테고리 메뉴 토글
// document.getElementById('categoryMenuBtn').addEventListener('click', function() {
//     const categoryMenu = document.getElementById('categoryMenu');
//
//     // categoryMenu에 'show' 클래스를 토글하여 텍스트를 보이게 또는 숨기게 만듦
//     categoryMenu.classList.toggle('show');
// });

window.addEventListener('scroll', function() {
    const headerTop = document.getElementById('header-top');
    const scrollPosition = window.scrollY;

    // 스크롤이 50px 이상 내려가면 헤더 배경색을 추가
    if (scrollPosition > 50) {
        headerTop.style.backgroundColor = 'rgba(255, 255, 255, 1)'; // 불투명 흰색 배경
    } else {
        headerTop.style.backgroundColor = 'rgba(255, 255, 255, 0)'; // 투명한 배경
    }
});

