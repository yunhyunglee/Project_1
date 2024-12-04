function goNext(){
    if( document.contract.okon[1].checked == true) {
        alert('회원 약관에 동의 하셔야 회원으로 가입이 가능합니다');
    }else if(document.contract.membertype==null||document.contract.membertype==undefined){
        alert("이용자구분을 선택하시오");
    } else if (!document.contract.membertype[0].checked && !document.contract.membertype[1].checked) {
        alert("이용자구분을 선택하시오");
    }else if(document.contract.membertype[0].checked==true){
        document.contract.action='userjoinform';
        document.contract.submit();
    }else if(document.contract.membertype[1].checked==true) {
        document.contract.action = 'businessjoinform';
        document.contract.submit();
    }
}