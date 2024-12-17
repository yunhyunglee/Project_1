<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />
<div class="content">
  <form method="POST" action="updatecheck">
    <hr>
    <p>정보수정 전 비밀번호 확인</p>
    <hr>
    아이디 :<input type="text" name="id" >
    <hr>
    비밀번호 :<input type="password"  name="pwd" >
    <div>${message}</div>
    <input type="submit" value="확인" >
  </form>

</div>
<%@ include file="../footer.jsp" %>
