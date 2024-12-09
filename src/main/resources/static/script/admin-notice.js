    // 아코디언 토글 함수
    function toggleAccordion(header) {
        const content = header.nextElementSibling; // 다음 형제 요소인 내용 가져오기
        if (content.style.display === "block") {
            content.style.display = "none"; // 닫기
        } else {
            content.style.display = "block"; // 열기
        }
    }

    function editNotice(nseq) {
        fetchAndPopulateModal(
            `/admin/notice/get/${nseq}`,
            'noticeEditModal', // 모달 ID
            {
                nseq: 'noticeId', // API 필드 -> HTML 필드
                title: 'noticeTitle',
                content: 'noticeContent'
            }
        );
    }


    // 수정 폼 제출
    function submitNoticeEditForm() {
        submitForm('/admin/notice/update', 'noticeEditForm', 'noticeEditModal');
    }


    function deleteNotice(nseq) {
        deleteItem(`/admin/notice/delete/${nseq}`, "정말로 이 공지사항을 삭제하시겠습니까?");
    }

    // 공지사항 추가 모달 열기
    function openAddNoticeModal() {
        const modal = document.getElementById('addNoticeModal');
        if (modal) {
            modal.style.display = 'flex'; // 모달 열기
        } else {
            console.error("Modal with ID 'addNoticeModal' not found.");
        }
    }

    // 공지사항 추가 폼 제출
    function submitAddNoticeForm() {
        const formElement = document.getElementById('addNoticeForm');
        if (!formElement) {
            console.error("Form with ID 'addNoticeForm' not found.");
            return;
        }

        const formData = new FormData(formElement);
        fetch('/admin/notice/add', {
            method: 'POST',
            body: formData,
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Failed to add notice.");
                }
                return response.text();
            })
            .then((result) => {
                alert(result);
                closeEditModal('addNoticeModal'); // 모달 닫기
                location.reload(); // 페이지 새로고침
            })
            .catch((error) => {
                console.error("Error adding notice:", error);
                alert("공지사항 추가 중 문제가 발생했습니다.");
            });
    }

