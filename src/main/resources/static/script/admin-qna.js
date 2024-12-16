function filterQnA(writerType) {
    const items = document.querySelectorAll('.accordion-item');
    items.forEach(item => {
        const writer = item.getAttribute('data-writer'); // 데이터 속성 확인
        if (writer === writerType) {
            item.style.display = "block"; // 해당 타입 보여줌
        } else {
            item.style.display = "none"; // 숨김
        }
    });
}

function filterQnAItems(queryId, className) {
    const query = document.getElementById(queryId).value.toLowerCase(); // 검색어 가져오기
    const items = document.getElementsByClassName(className); // QnA 항목 가져오기

    Array.from(items).forEach(item => {
        // 제목, 내용, 작성자를 각각 가져오기
        const title = item.querySelector('.accordion-header span').textContent.toLowerCase();
        const content = item.querySelector('.accordion-content p:nth-child(1)').textContent.toLowerCase();
        const writer = item.querySelector('.accordion-content p:nth-child(3)').textContent.toLowerCase();

        // 검색어가 제목, 내용, 작성자 중 하나라도 포함되어 있으면 표시
        if (title.includes(query) || content.includes(query) || writer.includes(query)) {
            item.style.display = "block"; // 해당 항목 표시
        } else {
            item.style.display = "none"; // 해당 항목 숨기기
        }
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
