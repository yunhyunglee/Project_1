function goNext(){
    if( document.contract.okon[1].checked == true) {
        alert('약관에 동의 후 가입이 가능합니다');
    }else if(document.contract.membertype==null||document.contract.membertype==undefined){
        alert("회원유형을 선택해주세요");
    } else if (!document.contract.membertype[0].checked && !document.contract.membertype[1].checked) {
        alert("회원유형을 선택해주세요");
    }else if(document.contract.membertype[0].checked==true){
        document.contract.action='userjoinform';
        document.contract.submit();
    }else if(document.contract.membertype[1].checked==true) {
        document.contract.action = 'businessjoinform';
        document.contract.submit();
    }
}