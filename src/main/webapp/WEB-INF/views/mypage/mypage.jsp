
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<section>--%>

<%--  <article>--%>
<%--    <a href="updateUserForm">회원정보 수정</a> <hr>--%>
<%--    <a href="ZZim">찜목록</a><hr>--%>
<%--    <a href="MyReview">내 후기목록</a><hr>--%>
<%--    <a href="MyReservation">내 예약내역</a><hr>--%>
<%--    <a href="myQna">qna</a><hr>--%>
<%--    <a href="deleteUserForm">탈퇴</a><hr>--%>
<%--  </article>--%>

<%--</section>--%>

<%--<%@ include file="../footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section class="mypage">

  <article class="my-info">
    <h3>내 정보</h3>
    <a href="updateUserForm">
      <i class="fa fa-user"></i> 회원정보 수정
    </a><hr>
    <a href="deleteUserForm">
      <i class="fa fa-trash"></i> 탈퇴
    </a><hr>
  </article>

  <article class="my-activities">
    <h3>내 활동</h3>
    <a href="ZZim">
      <i class="fa fa-heart"></i> 찜목록
    </a><hr>
    <a href="MyReview">
      <i class="fa fa-star"></i> 내 후기목록
    </a><hr>
    <a href="MyReservation">
      <i class="fa fa-calendar"></i> 내 예약내역
    </a><hr>
  </article>

  <article class="my-qa">
    <h3>Q&A</h3>
    <a href="myQna">
      <i class="fa fa-question-circle"></i> Q&A
    </a><hr>
  </article>

</section>

<%@ include file="../footer.jsp" %>
