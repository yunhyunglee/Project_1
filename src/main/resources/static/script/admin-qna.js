function filterQnA(writerType = null, page = 1, searchQuery = null, searchType = "title") {
    let url = `/admin/qna?page=${page}`;
    if (writerType) url += `&filter=${writerType}`;
    if (searchQuery) url += `&searchQuery=${encodeURIComponent(searchQuery)}&searchType=${searchType}`;

    fetch(url, { method: 'GET' })
        .then(response => {
            if (!response.ok) throw new Error("Failed to fetch QnA data.");
            return response.text();
        })
        .then(html => {
            document.getElementById("section-content").innerHTML = html; // 섹션 업데이트
        })
        .catch(error => {
            console.error("Error fetching QnA data:", error);
            alert("데이터를 불러오는 중 문제가 발생했습니다.");
        });
}






function toggleAccordion(header) {
    const content = header.nextElementSibling;
    content.style.display = content.style.display === "block" ? "none" : "block";
}

function saveReply(qseq) {
    const reply = document.getElementById(`reply-${qseq}`).value;

    fetch("/admin/qna/reply", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ qseq, reply }),
    })
        .then(response => {
            if (response.ok) {
                alert("답변이 저장되었습니다.");
                location.reload();
            } else {
                alert("저장 중 오류가 발생했습니다.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("네트워크 오류가 발생했습니다.");
        });
}
