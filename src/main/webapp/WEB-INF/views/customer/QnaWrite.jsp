<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div>
  <form action="QnaWrite" method="post"  name="formm">

    <h2> Q & A Write</h2>
    <div class="field" >
      <label>작성자</label>
      <c:choose>
        <c:when test="${not empty loginUser1}">
          <input type="text" name="writer1" value="${loginUser1.id}" readonly />
        </c:when>
        <c:otherwise>
          <input type="text" name="writer2" value="${loginUser2.id}" readonly />
        </c:otherwise>
      </c:choose>

    </div>

    <div class="field" >
      <label>Secret Mode</label>
      <div style="display:flex; justify-content: flex-start">
        <input name="secret" type="checkbox" value="Y" onchange="enable()"> 비밀글로 하기
        <input name="pwd" type="password" size="15" style="flex:4" disabled><br>
      </div>
    </div>


    <div class="field" >
      <label>제목</label><input type="text" name="title"  >
    </div>
    <div class="field" >
      <label>질문내용</label>
      <textarea name="content" rows="10"  cols="85" style="flex:4"></textarea>
    </div>
    <div class="btn" >
      <input type="submit" value="작성하기" />
    </div>
  </form>

</div>

<%@ include file="../footer.jsp" %>
