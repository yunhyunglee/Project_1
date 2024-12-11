<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<div class="sidebar">--%>
<%--  <!-- 회원정보 섹션 -->--%>
<%--  <div class="section">--%>
<%--    <h3>회원 정보</h3>--%>
<%--    <ul>--%>
<%--      <c:choose>--%>
<%--        <c:when test="${user == 1}">--%>
<%--          <li>--%>
<%--            <a href="updateUserForm" class="${pageContext.request.requestURI.contains('updateUserForm') ? 'active' : ''}">회원정보 수정</a>--%>
<%--          </li>--%>
<%--          <li>--%>
<%--            <a href="ZZim" class="${pageContext.request.requestURI.contains('ZZim') ? 'active' : ''}">찜목록</a>--%>
<%--          </li>--%>
<%--          <li>--%>
<%--            <a href="MyReview" class="${pageContext.request.requestURI.contains('MyReview') ? 'active' : ''}">내 후기목록</a>--%>
<%--          </li>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--          <li>--%>
<%--            <a href="updateUserForm" class="${pageContext.request.requestURI.contains('updateUserForm') ? 'active' : ''}">회원정보 수정</a>--%>
<%--          </li>--%>
<%--          <li>--%>
<%--            <a href="MyClass" class="${pageContext.request.requestURI.contains('MyClass') ? 'active' : ''}">내 클래스 관리</a>--%>
<%--          </li>--%>
<%--        </c:otherwise>--%>
<%--      </c:choose>--%>
<%--    </ul>--%>
<%--  </div>--%>

<%--  <!-- 예약/찜목록 섹션 -->--%>
<%--  <div class="section">--%>
<%--    <h3>내 활동</h3>--%>
<%--    <ul>--%>
<%--      <c:choose>--%>
<%--        <c:when test="${user == 1}">--%>
<%--          <li>--%>
<%--            <a href="MyReservation" class="${pageContext.request.requestURI.contains('MyReservation') ? 'active' : ''}">내 예약내역</a>--%>
<%--          </li>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--          <li>--%>
<%--            <a href="MyClass" class="${pageContext.request.requestURI.contains('MyClass') ? 'active' : ''}">내 클래스 관리</a>--%>
<%--          </li>--%>
<%--        </c:otherwise>--%>
<%--      </c:choose>--%>
<%--      <li>--%>
<%--        <a href="myQna" class="${pageContext.request.requestURI.contains('myQna') ? 'active' : ''}">Q&A</a>--%>
<%--      </li>--%>
<%--    </ul>--%>
<%--  </div>--%>

<%--  <!-- 탈퇴 섹션 -->--%>
<%--  <div class="section">--%>
<%--    <h3>계정 관리</h3>--%>
<%--    <ul>--%>
<%--      <li>--%>
<%--        <a href="deleteUserForm" class="${pageContext.request.requestURI.contains('deleteUserForm') ? 'active' : ''}">탈퇴</a>--%>
<%--      </li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--</div>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
  <!-- 회원정보 섹션 -->
  <div class="section">
    <h3>회원 정보</h3>
    <ul>
      <c:choose>
        <c:when test="${user == 1}">
          <li>
            <a href="updateUserForm" class="${pageContext.request.requestURI.contains('/updateUserForm') ? 'active' : ''}">회원정보 수정</a>
          </li>
          <li>
            <a href="ZZim" class="${pageContext.request.requestURI.contains('ZZim') ? 'active' : ''}">찜목록</a>
          </li>
          <li>
            <a href="MyReview" class="${pageContext.request.requestURI.contains('MyReview') ? 'active' : ''}">내 후기목록</a>
          </li>
        </c:when>
        <c:otherwise>
          <li>
            <a href="updateUserForm" class="${pageContext.request.requestURI.contains('/updateUserForm') ? 'active' : ''}">회원정보 수정</a>
          </li>
          <li>
            <a href="MyClass" class="${pageContext.request.requestURI.contains('MyClass') ? 'active' : ''}">내 클래스 관리</a>
          </li>
        </c:otherwise>
      </c:choose>
    </ul>
  </div>

  <!-- 예약/찜목록 섹션 -->
  <div class="section">
    <h3>내 활동</h3>
    <ul>
      <c:choose>
        <c:when test="${user == 1}">
          <li>
            <a href="MyReservation" class="${pageContext.request.requestURI.contains('MyReservation') ? 'active' : ''}">내 예약내역</a>
          </li>
        </c:when>
        <c:otherwise>
          <li>
            <a href="MyClass" class="${pageContext.request.requestURI.contains('MyClass') ? 'active' : ''}">내 클래스 관리</a>
          </li>
        </c:otherwise>
      </c:choose>
      <li>
        <a href="myQna" class="${pageContext.request.requestURI.contains('myQna') ? 'active' : ''}">Q&A</a>
      </li>
    </ul>
  </div>

  <!-- 탈퇴 섹션 -->
  <div class="section">
    <h3>계정 관리</h3>
    <ul>
      <li>
        <a href="deleteUserForm" class="${pageContext.request.requestURI.contains('deleteUserForm') ? 'active' : ''}">탈퇴</a>
      </li>
    </ul>
  </div>
</div>
