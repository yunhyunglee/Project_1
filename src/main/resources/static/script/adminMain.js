document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll(".section-btn");

    // 섹션 버튼 클릭 이벤트
    buttons.forEach(button => {
        button.addEventListener("click", function () {
            const section = this.dataset.section;
            loadSectionContent(`/admin/${section}`); // 섹션 경로로 로드
        });
    });

    // 페이징 링크 클릭 이벤트 (동적 요소에도 적용되도록 설정)
    document.addEventListener("click", function (e) {
        const link = e.target.closest(".pagination a");
        if (link) {
            e.preventDefault(); // 기본 링크 동작 방지
            const page = link.getAttribute("onclick"); // onclick 파라미터에서 페이지 정보 가져오기
            if (page) {
                eval(page); // onclick 내용을 실행
            }
        }
    });
});

// AJAX 요청을 통해 섹션 데이터 불러오기
function loadSectionContent(url) {
    if (!url || url === "#") return; // URL이 비어있으면 실행하지 않음
    fetch(url, { method: "GET" })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.text();
        })
        .then(html => {
            document.getElementById("section-content").innerHTML = html;

            // 페이징 링크 다시 바인딩
            bindPaginationLinks();
        })
        .catch(error => {
            console.error("Error fetching section content:", error);
            alert("데이터를 불러오는 중 문제가 발생했습니다. 다시 시도해주세요.");
        });
}

// 페이징 링크 이벤트 재등록 (동적 요소)
function bindPaginationLinks() {
    const paginationLinks = document.querySelectorAll(".pagination a");
    paginationLinks.forEach(link => {
        link.addEventListener("click", function (e) {
            e.preventDefault(); // 기본 동작 방지
            const page = link.getAttribute("onclick");
            if (page) eval(page); // onclick 실행
        });
    });
}

function adminLogout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        window.location.href = "/"; // 기본 페이지로 경로 설정
    }
}



