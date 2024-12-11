<h2>Q & A View</h2>

<div>
    <p><strong>작성자:</strong> ${qna.writer1 != null ? qna.writer1 : qna.writer2}</p>
    <p><strong>제목:</strong> ${qna.title}</p>
    <p><strong>등록일:</strong> ${qna.indate}</p>
    <p><strong>질문내용:</strong> ${qna.content}</p>
</div>

<div>
    <form id="reply-form">
        <label for="qna-reply"><strong>답변내용:</strong></label><br>
        <textarea id="qna-reply" name="reply" rows="5" cols="50">${qna.reply}</textarea><br>
        <input type="hidden" name="qseq" value="${qna.qseq}">
        <button type="button" id="save-reply">저장</button>
    </form>
</div>

<a href="/admin/qna">목록으로</a>

<script>
    document.getElementById("save-reply").addEventListener("click", function () {
        const formData = new FormData(document.getElementById("reply-form"));

        fetch('/admin/qna/reply', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) throw new Error('Failed to save reply.');
                return response.text();
            })
            .then(result => {
                alert('답변이 저장되었습니다.');
                location.href = '/admin/qna'; // 목록으로 이동
            })
            .catch(error => {
                console.error('Error:', error);
                alert('저장에 실패했습니다.');
            });
    });
</script>
