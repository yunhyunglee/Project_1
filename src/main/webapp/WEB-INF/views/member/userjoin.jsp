<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 화면이동없이 서버와 데이터를 주고 받을 수 있는 환경을 제공합니다	-->
<script type="text/javascript">
  $(function(){
    $('#idcheckButton').click(function(){
      var userId = $('#id').val().trim();
      if (userId === "") {
        $('#idmessage').html("&nbsp;&nbsp;<span style='color:red'>아이디를 입력하세요</span>");
        $('#reid').val("");
        return;
      }


      var formselect = $('#joinFrm')[0];
      var formdata = new FormData( formselect );
      $.ajax({
        url:"<%=request.getContextPath()%>/idcheck",
        type:"POST",
        // enctype:"multipart/form-data",
        async: false,
        data: formdata,
        timeout: 10000,
        contentType : false,
        processData : false,

        success:function(data){
          // alert(data.idmessage);

          if( data.idmessage == '1'){
            $('#idmessage').html("&nbsp;&nbsp;<span style='color:blue' >사용 가능한 아이디입니다</span>");
            $('#reid').val(data.id);
          }else{
            $('#idmessage').html("&nbsp;&nbsp;<span style='color:red' >이미 사용 중인 아이디입니다</span>");
            $('#reid').val("");
          }
        },
        error:function(){
          alert("아이디 중복검사에 실패했습니다.");
        },
      });
    });
  });
</script>
<div class="join-container">
  <form method="POST" action="/join" id="joinFrm" class="join-form">
    <input type="hidden" name="usertype" value="1">
    <h2 class="join-title">일반 회원가입</h2>
    <div class="terms-notice">
      약관에 동의하셨습니다. 아래 정보를 입력해 주세요.
    </div>

    <div class="form-group">
      <label for="id">아이디</label>
      <input type="text" id="id" name="id" value="${dto.id}" placeholder="아이디를 입력하세요">
      <button type="button" id="idcheckButton" class="btn-secondary">중복확인</button>
      <div id="idmessage"></div>
      <input type="hidden" name="reid" id="reid">
    </div>

    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
    </div>

    <div class="form-group">
      <label for="pwdchk">비밀번호 확인</label>
      <input type="password" id="pwdchk" name="pwdchk" placeholder="비밀번호를 다시 입력하세요">
    </div>

    <div class="form-group">
      <label for="name">이름</label>
      <input type="text" id="name" name="name" value="${dto.name}" placeholder="이름을 입력하세요">
    </div>

    <div class="form-group">
      <label for="email">이메일</label>
      <input type="text" id="email" name="email" value="${dto.email}" placeholder="이메일 주소를 입력하세요">
    </div>

    <div class="form-group">
      <label for="phone">전화번호</label>
      <input type="text" id="phone" name="phone" value="${dto.phone}" placeholder="전화번호를 입력하세요">
    </div>

    <div class="form-message">${message}</div>

    <div class="form-actions">
      <input type="submit" value="가입" class="btn-primary">
      <input type="button" onclick="location.href='/'" value="되돌아가기" class="btn-secondary">
    </div>

    <div class="divider"></div> <!-- 구분선 추가 -->

    <div class="kakao-login">
      <button type="button" class="kakao-btn"
              onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
        <img src="images/kakao_login.png" alt="카카오톡으로 시작하기">
      </button>
    </div>
  </form>
</div>
<%@ include file="../footer.jsp" %>
