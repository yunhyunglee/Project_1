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
