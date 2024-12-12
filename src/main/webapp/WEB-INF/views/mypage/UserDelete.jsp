<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<form method="POST" action="/deleteUser">--%>
<%--  <div>--%>
<%--    <label>id</label>    <input type="text" name="id" value="${dto.id}" readonly>--%>
<%--  </div>--%>
<%--  <div>--%>
<%--    <label>비밀번호</label>    <input type="password" name="pwd">--%>
<%--  </div>--%>

<%--  <div>${message}</div>--%>

<%--  <div>--%>
<%--    <input type="submit" value="탈퇴"> <input type="button" onclick="location.href='/'" value="되돌아가기">--%>
<%--  </div>--%>
<%--</form>--%>

<%--<%@ include file="../footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-container">
  <!-- 사이드바 포함 -->
  <jsp:include page="../sidebar.jsp" />

  <div class="content">
    <h2>회원 탈퇴</h2>
    <p class="description">회원 탈퇴를 위해 비밀번호를 입력해 주세요.</p>

    <form class="mypage-form" method="POST" action="/deleteUser">
      <div>
        <label for="id">아이디</label>
        <input type="text" id="id" name="id" value="${dto.id}" readonly>
      </div>
      <div>
        <label for="pwd">비밀번호</label>
        <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
      </div>

      <div class="message">${message}</div>

      <div class="buttons">
        <input type="submit" value="탈퇴">
        <input type="button" onclick="location.href='/'" value="되돌아가기">
      </div>
    </form>
  </div>
</div>

<!-- 확인 모달 -->
<div id="confirmationModal" class="modal">
  <div class="modal-content">
    <p>정말로 탈퇴를 진행하시겠습니까?</p>
    <div class="modal-buttons">
      <button onclick="proceedDeletion()">예</button>
      <button onclick="closeModal()">아니오</button>
    </div>
  </div>
</div>

<%@ include file="../footer.jsp" %>

