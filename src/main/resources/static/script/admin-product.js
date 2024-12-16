

// 상품 삭제
function deleteProduct(productId) {
    deleteItem(`/admin/product/delete/${productId}`, "정말로 이 상품을 삭제하시겠습니까?"); // 공통 deleteItem 활용
}


function searchProducts() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const rows = document.querySelectorAll("table tbody tr");
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(input) ? "" : "none";
    });
}