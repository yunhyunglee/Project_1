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
