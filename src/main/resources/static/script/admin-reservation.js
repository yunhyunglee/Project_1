function filterReservation(status) {
    // AJAX 요청을 보내서 필터링된 데이터 가져오기
    fetch(`/admin/reservation/filter?status=${status}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch reservation data.");
            }
            return response.json();
        })
        .then(data => {
            const tableBody = document.querySelector("tbody");
            tableBody.innerHTML = ""; // 기존 테이블 내용 제거

            data.forEach(reservation => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${reservation.reseq}</td>
                    <td>${reservation.userid}</td>
                    <td>${reservation.title}</td>
                    <td>${reservation.people}</td>
                    <td>${reservation.classday} ${reservation.classtime}</td>
                    <td>${reservation.payment === 'Y' ? '완료' : '대기중'}</td>
                    <td>${reservation.endedclass === 'Y' ? '클래스 마감' : '진행 중'}</td>
                    <td><button onclick="deleteReservation(${reservation.reseq})">삭제</button></td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error("Error filtering reservations:", error);
            alert("필터링 중 문제가 발생했습니다.");
        });
}


function deleteReservation(reseq) {
    if (confirm("정말 삭제하시겠습니까?")) {
    // 예약 삭제 요청
    fetch(`/admin/reservation/delete/${reseq}`, {
    method: 'DELETE'
}).then(response => {
    if (response.ok) {
    alert("삭제되었습니다.");
    location.reload();
} else {
    alert("삭제에 실패했습니다.");
}
});
}
}


    function searchReservations() {
        const input = document.getElementById("searchInput").value.toLowerCase();
        const rows = document.querySelectorAll("table tbody tr");
        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(input) ? "" : "none";
        });
    }