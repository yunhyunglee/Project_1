
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <form method="post" action="login" name="loginForm">
            <h2>LogIn</h2>
            <div class="field">
                <label>User ID</label><input name="id" type="text"/>
            </div>
            <div class="field">
                <label>Password</label><input name="pwd" type="password" >
            </div>
            <div class="field">
                <input type="radio" name="usertype" value="1" checked/>개인 &nbsp;&nbsp;
                <input type="radio" name="usertype" value="2">사업자
            </div>
            <div class="btn">
                <input type="submit" value="LOGIN">
                <input type="button" value="JOIN"  onclick="location.href='joinform'" >
                <input type="button" value="FIND ID"  onclick="" >
            </div>
            <div class="btn">
                <input type="button" value="KaKao" style="background: yellow; color:black"
                       onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=ee591d70889057034963a4ca3516fa78&redirect_uri=http://localhost:8070/kakaoLogin&response_type=code'">
                <input type="button" value="Naver" style="background: green" onclick="" >
                <input type="button" value="Google" style="background: red" onclick="" >

            </div>
            <div style="font-size:80%; font-weight:bold">${message} </div>

        </form>
    </article>

</section>

<%@ include file="../footer.jsp" %>