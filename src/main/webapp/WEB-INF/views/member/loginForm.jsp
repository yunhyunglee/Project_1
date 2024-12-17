
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>
<%--<div class="loginForm-wrap">--%>
<%--    <section class="login-section">--%>
<%--        <article>--%>
<%--            <form method="post" action="login" name="loginForm">--%>
<%--                <h2>로그인</h2>--%>
<%--                <div class="field">--%>
<%--                    &lt;%&ndash;                    <label>ID</label>&ndash;%&gt;--%>
<%--                    <input name="id" type="text" placeholder="아이디를 입력하세요">--%>
<%--                </div>--%>
<%--                <div class="field">--%>
<%--                    &lt;%&ndash;                    <label>Password</label>&ndash;%&gt;--%>
<%--                    <input name="pwd" type="password" placeholder="비밀번호를 입력하세요">--%>
<%--                </div>--%>
<%--                <div class="field radio-group">--%>
<%--                    <label>--%>
<%--                        <input type="radio" name="usertype" value="1" checked> 개인--%>
<%--                    </label>--%>
<%--                    <label>--%>
<%--                        <input type="radio" name="usertype" value="2"> 사업자--%>
<%--                    </label>--%>
<%--                </div>--%>

<%--                <div class="login-btn">--%>
<%--                    <input type="submit" value="로그인">--%>
<%--                    &lt;%&ndash;                    <input type="button" value="회원가입" onclick="location.href='joinform'">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <input type="button" value="아이디 찾기" onclick="">&ndash;%&gt;--%>
<%--                </div>--%>

<%--                <div class="divider"></div>--%>

<%--                <div class="kakao-login">--%>
<%--                    <button type="button" class="kakao-btn"--%>
<%--                            onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">--%>
<%--                        <img src="images/kakao_login.png" alt="카카오톡으로 시작하기">--%>
<%--                    </button>--%>
<%--                </div>--%>

<%--                <div style="font-size:80%; font-weight:bold">${message} </div>--%>

<%--            </form>--%>
<%--        </article>--%>

<%--    </section>--%>
<%--</div>--%>
<%--<%@ include file="../footer.jsp" %>--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<div class="login-container">--%>
<%--    <form method="post" action="login" id="loginForm">--%>
<%--        <h2 class="login-title">로그인</h2>--%>
<%--        <div class="login-notice">회원 유형 선택 후 아이디와 비밀번호를 입력해 주세요.</div>--%>

<%--        <!-- 회원 유형 선택 라디오 버튼 -->--%>
<%--        <div class="login-form-group">--%>
<%--            <div class="login-radio-group">--%>
<%--                <input type="radio" id="userTypePersonal" name="userType" value="1" checked>--%>
<%--                <label for="userTypePersonal">개인 회원</label>--%>

<%--                <input type="radio" id="userTypeBusiness" name="userType" value="2">--%>
<%--                <label for="userTypeBusiness">사업자 회원</label>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- 아이디 입력 -->--%>
<%--        <div class="login-form-group">--%>
<%--            <label for="id">아이디</label>--%>
<%--            <input type="text" id="id" name="id" placeholder="아이디를 입력하세요">--%>
<%--        </div>--%>

<%--        <!-- 비밀번호 입력 -->--%>
<%--        <div class="login-form-group">--%>
<%--            <label for="pwd">비밀번호</label>--%>
<%--            <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">--%>
<%--        </div>--%>





<%--        <!-- 버튼 영역 -->--%>
<%--        <div class="login-actions">--%>
<%--            <input type="submit" value="로그인" class="login-btn-primary">--%>
<%--            <input type="button" onclick="location.href='joinform'" value="회원가입" class="login-btn-secondary">--%>
<%--        </div>--%>

<%--        <div class="login-divider"></div>--%>

<%--        <div class="kakao-login">--%>
<%--            <button type="button" class="kakao-btn"--%>
<%--                    onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">--%>
<%--                <img src="images/kakao_login.png" alt="카카오톡으로 시작하기">--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<%@ include file="../footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="login-container">
    <form method="post" action="login" name="loginForm" id="loginForm">
        <h2 class="login-title">로그인</h2>
        <div class="login-notice">회원 유형 선택 후 아이디와 비밀번호를 입력해 주세요.</div>

        <!-- 회원 유형 선택 라디오 버튼 -->
        <div class="login-form-group">
            <div class="login-radio-group">
                <input type="radio" id="userTypePersonal" name="usertype" value="1" checked>
                <label for="userTypePersonal">👤 일반 회원</label>

                <input type="radio" id="userTypeBusiness" name="usertype" value="2">
                <label for="userTypeBusiness">🏢 사업자 회원</label>
            </div>
        </div>

        <!-- 아이디 입력 -->
        <div class="login-form-group">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
        </div>

        <!-- 비밀번호 입력 -->
        <div class="login-form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>
        </div>

        <!-- 버튼 영역 -->
        <div class="login-actions">
            <input type="submit" value="로그인" class="login-btn-primary">
            <input type="button" onclick="location.href='joinform'" value="회원가입" class="login-btn-secondary">
        </div>

        <div class="login-divider"></div>

        <div style="font-size:80%; font-weight:bold">${message} </div>

        <!-- 카카오 로그인 -->
        <div class="kakao-login">
            <button type="button" class="kakao-btn"
                    onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=f67ebc2de23039bbce25c7d2583abd81&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
                <img src="images/kakao_login.png" alt="카카오톡으로 시작하기">
            </button>
        </div>
    </form>

</div>

<%@ include file="../footer.jsp" %>
