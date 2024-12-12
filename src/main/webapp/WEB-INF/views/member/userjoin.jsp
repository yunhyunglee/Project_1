<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 화면이동없이 서버와 데이터를 주고 받을 수 있는 환경을 제공합니다	-->
<script type="text/javascript">
  $(function(){
    $('#idcheckButton').click(function(){

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
            $('#idmessage').html("&nbsp;&nbsp;<span style='color:blue' >사용 가능합니다</span>");
            $('#reid').val(data.id);
          }else{
            $('#idmessage').html("&nbsp;&nbsp;<span style='color:red' >사용중인 아이디입니다</span>");
            $('#reid').val("");
          }
        },
        error:function(){
          alert("중복 조회 실패");
        },
      });
    });
  });
</script>

<%--<form method="POST" action="/join" id="joinFrm">--%>
<%--  개인이용자용 가입페이지--%>
<%--  <div>--%>
<%--    <input type="hidden" name="usertype" value="1">--%>
<%--    <label>id</label> <input type="text" name="id" value="${dto.id}"> <input type="button" value="중복확인" id="idcheckButton">--%>
<%--    <div id="idmessage"></div>--%>
<%--    <input type="hidden" name="reid" id="reid">--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>비밀번호</label> <input type="password" name="pwd">--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>비밀번호 확인</label> <input type="password" name="pwdchk">--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>이름</label> <input type="text" name="name" value="${dto.name}">--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>E-mail</label> <input type="text" name="email" value="${dto.email}">--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>전화번호</label> <input type="text" name="phone" value="${dto.phone}">--%>
<%--  </div>--%>
<%--  <div style="font-size:80%; font-weight:bold">${message} </div>--%>
<%--  <div>--%>
<%--    <input type="submit" value="가입"> <input type="button" onclick="location.href='/'" value="되돌아가기">--%>
<%--  </div>--%>
<%--</form>--%>
<form method="POST" action="/join" id="joinFrm">
  <h2 style="text-align: center;">회원가입</h2>
  <div>
    <label for="id">아이디</label>
    <input type="text" id="id" name="id" value="${dto.id}">
    <input type="button" value="중복확인" id="idcheckButton">
    <div id="idmessage"></div>
    <input type="hidden" name="reid" id="reid">
  </div>
  <div>
    <label for="pwd">비밀번호</label>
    <input type="password" id="pwd" name="pwd">
  </div>
  <div>
    <label for="pwdchk">비밀번호 확인</label>
    <input type="password" id="pwdchk" name="pwdchk">
  </div>
  <div>
    <label for="name">이름</label>
    <input type="text" id="name" name="name" value="${dto.name}">
  </div>
  <div>
    <label for="email">E-mail</label>
    <input type="text" id="email" name="email" value="${dto.email}">
  </div>
  <div>
    <label for="phone">전화번호</label>
    <input type="text" id="phone" name="phone" value="${dto.phone}">
  </div>
  <div style="font-size:80%; font-weight:bold">${message}</div>
  <div>
    <input type="submit" value="가입">
    <div class="kakao-login">
      <button type="button" class="kakao-btn"
              onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
        <img src="images/kakao_login.png" alt="카카오톡으로 시작하기">
      </button>
    </div>
    <input type="button" onclick="location.href='/'" value="되돌아가기">
  </div>
</form>

<%@ include file="../footer.jsp" %>
