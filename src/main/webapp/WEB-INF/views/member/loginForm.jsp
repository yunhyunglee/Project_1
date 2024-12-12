
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<div class="loginForm-wrap">
    <section class="login-section">
        <article>
            <form method="post" action="login" name="loginForm">
                <h2>로그인</h2>
                <div class="field">
                    <%--                    <label>ID</label>--%>
                    <input name="id" type="text" placeholder="아이디를 입력하세요">
                </div>
                <div class="field">
                    <%--                    <label>Password</label>--%>
                    <input name="pwd" type="password" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="field radio-group">
                    <label>
                        <input type="radio" name="usertype" value="1" checked> 개인
                    </label>
                    <label>
                        <input type="radio" name="usertype" value="2"> 사업자
                    </label>
                </div>

                <div class="login-btn">
                    <input type="submit" value="로그인">
                    <%--                    <input type="button" value="회원가입" onclick="location.href='joinform'">--%>
                    <%--                    <input type="button" value="아이디 찾기" onclick="">--%>
                </div>
                <div class="kakao-login">
                    <button type="button" class="kakao-btn"
                            onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
                        <img src="images/kakao_login.png" alt="카카오톡으로 시작하기">
                    </button>
                </div>

                <div style="font-size:80%; font-weight:bold">${message} </div>

            </form>
        </article>

    </section>
</div>
<%@ include file="../footer.jsp" %>