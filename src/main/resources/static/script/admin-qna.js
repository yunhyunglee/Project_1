function initializeQnaEvents() {
    console.log("QnA 이벤트 초기화 중...");

    // 상세보기 버튼 클릭 이벤트 설정
    document.querySelectorAll(".view-detail").forEach(button => {
        button.addEventListener("click", function () {
            const qseq = this.dataset.qseq;

            fetch(`/admin/qna/get/${qseq}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Failed to fetch QnA details: ${response.statusText}`);
                    }
                    return response.json(); // QnA 데이터를 JSON 형식으로 수신
                })
                .then(data => {
                    if (!data) {
                        alert("QnA 데이터를 찾을 수 없습니다.");
                        return;
                    }

                    // 데이터를 HTML에 삽입
                    document.getElementById("qna-title").textContent = data.title || "제목 없음";
                    document.getElementById("qna-content").textContent = data.content || "내용 없음";
                    document.getElementById("qna-writer").textContent = data.writer1 || data.writer2 || "작성자 없음";
                    document.getElementById("qna-date").textContent = data.indate || "작성일 없음";
                    document.getElementById("qna-reply").value = data.reply || "";
                    document.getElementById("save-reply").dataset.qseq = qseq;

                    // 상세보기 폼 표시
                    document.getElementById("qna-detail").style.display = "block";
                })
                .catch(error => {
                    console.error("QnA 상세 데이터를 가져오는 중 오류 발생:", error);
                    alert("QnA 데이터를 가져오는 데 실패했습니다.");
                });
        });
    });

    // 답변 저장 버튼 클릭 이벤트 설정
    const saveReplyButton = document.getElementById("save-reply");
    if (saveReplyButton) {
        saveReplyButton.addEventListener("click", function () {
            const qseq = this.dataset.qseq;
            const reply = document.getElementById("qna-reply").value.trim();

            if (!reply) {
                alert("답변 내용을 입력하세요.");
                return;
            }

            fetch(`/admin/qna/reply`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ qseq, reply }),
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Failed to save reply: ${response.statusText}`);
                    }
                    alert("답변이 성공적으로 저장되었습니다.");
                    location.reload();
                })
                .catch(error => {
                    console.error("답변 저장 중 오류 발생:", error);
                    alert("답변 저장에 실패했습니다.");
                });
        });
    } else {
        console.error("답변 저장 버튼을 찾을 수 없습니다.");
    }
}
