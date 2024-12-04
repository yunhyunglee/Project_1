<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<form method="POST" action="/deleteUser">
  <div>
    <label>id</label>    <input type="text" name="id" value="${dto.id}" readonly>
  </div>
  <div>
    <label>비밀번호</label>    <input type="password" name="pwd">
  </div>

  <div>${message}</div>

  <div>
    <input type="submit" value="탈퇴"> <input type="button" onclick="location.href='/'" value="되돌아가기">
  </div>
</form>

<%@ include file="../footer.jsp" %>