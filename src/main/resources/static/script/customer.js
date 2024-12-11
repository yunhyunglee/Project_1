function toggleFAQ() {
    const questionBar = document.querySelector('.question-bar');
    const questionList = document.getElementById('questionList');

    // toggle 클래스 추가/제거
    questionBar.classList.toggle('open');
    // 목록 표시/숨기기
    if (questionList.style.display === 'none' || questionList.style.display === '') {
        questionList.style.display = 'block';
    } else {
        questionList.style.display = 'none';
    }
}

function enable(){
    if(document.formm.secret.checked==true) {
        document.formm.pwd.disabled = false;
    }else {
        document.formm.pwd.disabled = true;
        document.formm.pwd.value="";
    }
}
