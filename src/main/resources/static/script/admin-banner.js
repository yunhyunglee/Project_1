// 아코디언 토글 함수
function toggleAccordion(header) {
    const content = header.nextElementSibling;
    content.style.display = content.style.display === "block" ? "none" : "block";
}

// 수정 버튼 클릭
function editBanner(bannerId) {
    fetchAndPopulateModal(`/admin/banner/get/${bannerId}`, 'bannerEditModal', {
        bannerId: 'bannerId',
        title: 'bannerTitle',
        image: 'bannerImage',
        content: 'bannerContent',
        link: 'bannerLink',
        priority: 'bannerPriority',
        active: 'bannerActive'
    });
}

// 추가 버튼 클릭
function openAddBannerModal() {
    document.getElementById('bannerAddModal').style.display = 'flex';
}

// 수정 폼 제출
function submitBannerEditForm() {
    submitForm('/admin/banner/update', 'bannerEditForm', 'bannerEditModal');
}

// 추가 폼 제출
function submitAddBannerForm() {
    submitForm('/admin/banner/add', 'bannerAddForm', 'bannerAddModal');
}

// 삭제 버튼 클릭
function deleteBanner(bannerId) {
    console.log("삭제 요청 bannerId: ", bannerId);
    deleteItem(`/admin/banner/delete/${bannerId}`, "정말로 이 배너를 삭제하시겠습니까?");
}
