// 수정 버튼 클릭
function editUser(id) {
    fetchAndPopulateModal(
        `/admin/user/get/${id}`,
        'userEditModal', // 모달 ID
        {
            id: 'editUserId', // API 필드 -> HTML 필드
            name: 'editName',
            email: 'editEmail',
            phone: 'editPhone'
        }
    );
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