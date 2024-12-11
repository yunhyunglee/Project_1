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