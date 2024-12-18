// 수정 버튼 클릭
function editBusiness(id) {
    fetchAndPopulateModal(
        `/admin/business/get/${id}`,
        'businessEditModal', // 모달 ID
        {
            id: 'editBusinessId', // API 필드 -> HTML 필드
            name: 'editName',
            phone: 'editPhone',
            email: 'editEmail'
        }
    );
}

function searchBusiness(page = 1) {
    const searchQuery = document.getElementById('searchQuery').value;
    const searchType = document.getElementById('searchType').value; // 검색 기준 (ID, 이름, 이메일)

    fetch(`/admin/business?page=${page}&searchQuery=${searchQuery}&searchType=${searchType}`, { method: 'GET' })
        .then(response => response.text())
        .then(html => {
            document.getElementById("section-content").innerHTML = html;
        })
        .catch(error => {
            console.error("Error fetching user list:", error);
            alert("데이터를 불러오는 중 문제가 발생했습니다.");
        });
}
// 페이징 링크 클릭 이벤트
function goToPageB(page) {
    searchBusiness(page);
}


// 수정 폼 제출
function submitBusinessEditForm() {
    submitForm('/admin/business/update', 'businessEditForm', 'businessEditModal');
}

// 삭제 요청
function deleteBusiness(id) {
    deleteItem(`/admin/business/delete/${id}`, "정말로 이 사업자를 삭제하시겠습니까?");
}

document.getElementById("searchQueryBusiness").addEventListener('keyup', () => {
    filterItems('searchQueryBusiness', 'card'); // 사업자 관리에서 검색 필터링
});


function loadProductsForBusiness(businessId, targetElementId) {
    const targetElement = document.getElementById(targetElementId);
    const toggleButton = event.target; // 클릭한 버튼 가져오기

    // 이미 열려 있을 때: 닫기 동작
    if (targetElement && targetElement.style.display === 'block') {
        targetElement.style.display = 'none'; // 닫기
        toggleButton.textContent = '상품 목록 열기'; // 버튼 텍스트를 "열기"로 변경
        return;
    }

    // 열려 있지 않을 때: 데이터 로드 후 열기
    fetch(`/admin/business/${businessId}/products`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Failed to fetch products: ${response.status}`);
            }
            return response.json();
        })
        .then(products => {
            if (!targetElement) {
                console.error(`Target element with ID "${targetElementId}" not found.`);
                return;
            }

            if (products.length === 0) {
                targetElement.innerHTML = "<p>상품이 없습니다.</p>";
            } else {
                const productListHtml = products.map(product =>
                    `<li>${product.title} - ${product.price}원</li>`
                ).join('');
                targetElement.innerHTML = `<ul>${productListHtml}</ul>`;
            }

            // 상품 목록 표시
            targetElement.style.display = 'block'; // 열기
            toggleButton.textContent = '상품 목록 닫기'; // 버튼 텍스트를 "닫기"로 변경
        })
        .catch(error => {
            console.error("Error loading products:", error);
            alert("상품 데이터를 불러오는 중 문제가 발생했습니다.");
        });
}


