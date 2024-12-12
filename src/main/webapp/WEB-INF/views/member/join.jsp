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
                        $('#idmessage').html("&nbsp;&nbsp;<span style='color:blue' >사용 가능한 아이디입니다</span>");
                        $('#reid').val(data.id);
                    }else{
                        $('#idmessage').html("&nbsp;&nbsp;<span style='color:red' >사용 중인 아이디입니다</span>");
                        $('#reid').val("");
                    }
                },
                error:function(){
                    alert("아이디 중복 조회에 실패했습니다.");
                },
            });
        });
    });
</script>

<section class="join-container">
    <h2 class="join-title">회원가입</h2>
    <form method="POST" action="/join" id="joinFrm" class="join-form">
        <!-- ID 입력 및 중복 확인 -->
        <div class="form-group">
            <label for="id">아이디</label>
            <div class="input-group">
                <input type="text" name="id" id="id" placeholder="아이디를 입력하세요" value="${dto.id}">
                <button type="button" id="idcheckButton" class="check-btn">중복확인</button>
            </div>
            <div id="idmessage" class="message"></div>
            <input type="hidden" name="reid" id="reid">
        </div>

        <!-- 비밀번호 -->
        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요">
        </div>

        <!-- 비밀번호 확인 -->
        <div class="form-group">
            <label for="pwdchk">비밀번호 확인</label>
            <input type="password" name="pwdchk" id="pwdchk" placeholder="비밀번호를 다시 입력하세요">
        </div>

        <!-- 이름 -->
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" placeholder="이름을 입력하세요" value="${dto.name}">
        </div>

        <!-- 이메일 -->
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" name="email" id="email" placeholder="이메일을 입력하세요" value="${dto.email}">
        </div>

        <!-- 전화번호 -->
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요" value="${dto.phone}">
        </div>

        <!-- 사업자 체크 -->
        <div class="form-group checkbox-group">
            <label for="businessman">사업자입니까?</label>
            <input type="checkbox" name="businessman" id="businessman" value="true">
        </div>

        <!-- 버튼 그룹 -->
        <div class="button-group">
            <input type="submit" value="가입" class="btn submit-btn">
            <input type="button" onclick="location.href='/'" value="되돌아가기" class="btn cancel-btn">
        </div>
    </form>
</section>

<%@ include file="../footer.jsp" %>


