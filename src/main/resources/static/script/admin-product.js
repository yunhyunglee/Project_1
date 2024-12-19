

// 상품 삭제
function deleteProduct(productId) {
    deleteItem(`/admin/product/delete/${productId}`, "정말로 이 상품을 삭제하시겠습니까?"); // 공통 deleteItem 활용
}


// 검색 버튼 클릭 시 동작하는 함수
function searchProducts() {
    const searchInput = document.getElementById("searchInput").value; // 검색어 가져오기
    const url = `/admin/product?searchQuery=${encodeURIComponent(searchInput)}&page=1`;

    // 서버로 검색 요청을 보냄
    fetch(url, { method: "GET" })
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch search results.");
            }
            return response.text(); // JSP 파일 내용 반환
        })
        .then(html => {
            // 새로운 HTML을 section-content에 업데이트
            document.getElementById("section-content").innerHTML = html;
        })
        .catch(error => {
            console.error("Error:", error);
            alert("검색 중 오류가 발생했습니다.");
        });
}





function goToPageP(page) {
    fetch(`/admin/product?page=${page}`, { method: 'GET' })
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch page data.");
            }
            return response.text(); // 서버에서 JSP로 렌더링된 HTML 반환
        })
        .then(html => {
            document.getElementById("section-content").innerHTML = html; // 새로운 HTML 로드
            bindPaginationLinks(); // 페이징 링크 다시 바인딩
        })
        .catch(error => {
            console.error("Error loading page data:", error);
            alert("페이지 데이터를 불러오는 중 문제가 발생했습니다.");
        });
}



