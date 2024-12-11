document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll(".section-btn");
    const contentArea = document.getElementById("section-content");

    buttons.forEach(button => {
        button.addEventListener("click", function () {
            const section = this.dataset.section;
            fetch(`/admin/${section}`) // 서버에서 섹션 데이터 요청
                .then(response => response.text())
                .then(html => {
                    contentArea.innerHTML = html; // 섹션 콘텐츠 로드
                })
                .catch(err => {
                    console.error("Error loading section:", err);
                    contentArea.innerHTML = `<p>섹션을 로드하는 데 문제가 발생했습니다.</p>`;
                });
        });
    });
});



function adminLogout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        window.location.href = "/"; // 기본 페이지로 경로 설정
    }
}
