
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<form method="POST" action="/updateUser">
    <div>
        <label>id</label>    <input type="text" name="id" value="${dto.id}" readonly>
    </div>
    <div>
        <label>비밀번호</label>    <input type="password" name="pwd">
    </div>
    <div>
        <label>비밀번호 확인</label>    <input type="password" name="pwdchk">
    </div>
    <div>
        <label>이름</label>    <input type="text" name="name" value="${dto.name}">
    </div>
    <div>
        <label>E-mail</label>    <input type="text" name="email" value="${dto.email}">
    </div>
    <div>
        <label>전화번호</label>   <input type="text" name="phone" value="${dto.phone}">
    </div>
    <div>${message}</div>

    <div>
        <input type="submit" value="수정"> <input type="button" onclick="location.href='/'" value="되돌아가기">
    </div>
</form>

<%@ include file="../footer.jsp" %>
