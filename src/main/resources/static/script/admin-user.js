// 수정 버튼 클릭
function editUser(id) {
    fetchAndPopulateModal(
        `/admin/user/get/${id}`,
        'userEditModal', // 모달 ID
        {
            id: 'editUserId', // API 필드 -> HTML 필드
            name: 'editName',
            email: 'editEmail',
            phone: 'editPhone',
            pwd: 'editPwd'
        }
    );
}

function searchUsers(page = 1) {
    const searchQuery = document.getElementById('searchQuery').value;
    const searchType = document.getElementById('searchType').value; // 검색 기준 (ID, 이름, 이메일)

    fetch(`/admin/user?page=${page}&searchQuery=${searchQuery}&searchType=${searchType}`, { method: 'GET' })
        .then(response => response.text())
        .then(html => {
            document.getElementById("section-content").innerHTML = html;
        })
        .catch(error => {
            console.error("Error fetching user list:", error);
            alert("데이터를 불러오는 중 문제가 발생했습니다.");
        });
}

// 검색창 이벤트
document.getElementById("searchQuery").addEventListener('keyup', () => searchUsers());

// 페이징 링크 클릭 이벤트
function goToPage(page) {
    searchUsers(page);
}


// 수정 폼 제출
function submitUserEditForm() {
    submitForm('/admin/user/update', 'userEditForm', 'userEditModal');
}

// 삭제 요청
function deleteUser(id) {
    deleteItem(`/admin/user/delete/${id}`, "정말로 이 회원을 삭제하시겠습니까?");
}

document.getElementById("searchQuery").addEventListener('keyup', () => {
    filterItems('searchQuery', 'card'); // 회원 관리에서 검색 필터링
});



