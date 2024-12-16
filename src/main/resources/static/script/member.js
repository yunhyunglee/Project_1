function goNext(){
    if( document.contract.okon[1].checked == true) {
        alert('약관에 동의해야 다음 단계로 진행할 수 있습니다.');
    }else if(document.contract.membertype==null||document.contract.membertype==undefined){
        alert("회원 유형을 선택해주세요");
    } else if (!document.contract.membertype[0].checked && !document.contract.membertype[1].checked) {
        alert("회원 유형을 선택해주세요");
    }else if(document.contract.membertype[0].checked==true){
        document.contract.action='userjoinform';
        document.contract.submit();
    }else if(document.contract.membertype[1].checked==true) {
        document.contract.action = 'businessjoinform';
        document.contract.submit();
    }
}

function selectMemberType(type) {
    document.getElementById("personal-member-card").classList.remove("selected");
    document.getElementById("business-member-card").classList.remove("selected");
    document.getElementById(type).classList.add("selected");

    // 실제 라디오 버튼 선택
    if (type === "personal-member-card") {
        document.getElementById("personal-member").checked = true;
    } else if (type === "business-member-card") {
        document.getElementById("business-member").checked = true;
    }
}