let currentSearchQuery = ""; // 검색어 상태 저장
let currentStatus = ""; // 필터 상태 저장

// 검색 및 페이징 처리
function searchReservations(page = 1) {
    // 검색어 가져오기
    const searchInput = document.getElementById("searchInput");
    if (searchInput) currentSearchQuery = searchInput.value.trim();

    // 서버에 검색어, 필터 상태, 페이지 번호 전송
    fetch(`/admin/reservation?page=${page}&searchQuery=${encodeURIComponent(currentSearchQuery)}&status=${currentStatus}`)
        .then(response => response.text())
        .then(html => {
            // 서버에서 가져온 HTML에서 테이블과 페이징 부분만 추출
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, "text/html");

            // 테이블과 페이징 부분만 업데이트
            document.getElementById("reservationTableBody").innerHTML = doc.querySelector("#reservationTableBody").innerHTML;
            document.querySelector(".pagination").innerHTML = doc.querySelector(".pagination").innerHTML;

            // 검색창 값 유지
            document.getElementById("searchInput").value = currentSearchQuery;
        })
        .catch(error => {
            console.error("Error fetching reservation list:", error);
            alert("데이터를 불러오는 중 문제가 발생했습니다.");
        });
}

// 필터 버튼 클릭
function filterReservations(status) {
    currentStatus = status; // 필터 상태 저장
    currentSearchQuery = ""; // 검색어 초기화
    document.getElementById("searchInput").value = ""; // 검색창 초기화
    searchReservations(1); // 첫 페이지 요청
}

// 검색 버튼 클릭
function onSearchButtonClick() {
    searchReservations(1); // 첫 페이지 검색
}


// 예약 삭제 함수
function deleteReservation(reseq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        fetch(`/admin/reservation/delete/${reseq}`, { method: 'DELETE' })
            .then(response => {
                if (response.ok) {
                    alert("삭제되었습니다.");
                    searchReservations(1); // 삭제 후 첫 페이지로 갱신
                } else {
                    alert("삭제에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error("Error deleting reservation:", error);
                alert("삭제 중 문제가 발생했습니다.");
            });
    }
}

// 정산 처리 함수
function processPayment(reseq) {
    if (confirm("정산을 진행하시겠습니까?")) {
        fetch(`/processPayment?reseq=${reseq}`, { method: 'POST' })
            .then(response => {
                if (response.ok) {
                    alert("정산이 완료되었습니다.");
                    searchReservations(1); // 정산 후 첫 페이지로 갱신
                } else {
                    alert("정산 처리에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error("Error processing payment:", error);
                alert("정산 처리 중 문제가 발생했습니다.");
            });
    }
}
