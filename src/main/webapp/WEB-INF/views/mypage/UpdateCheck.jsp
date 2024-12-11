
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section class="mypage">



  <form method="POST" action="updatecheck">
    <hr>
    <p>정보수정 전 비밀번호 확인</p>
    <hr>
    <input type="text" name="id" >
    <hr>
    <input type="password"  name="pwd" >
    <input type="submit" value="확인" >
  </form>

</section>

<%@ include file="../footer.jsp" %>
