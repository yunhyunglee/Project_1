<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>
<%--<div class="mypage-container">--%>
<%--    <!-- 사이드바 포함 -->--%>
<%--    <jsp:include page="../sidebar.jsp" />--%>

<%--    <!-- 본문 -->--%>
<%--    <div class="content">--%>
<%--        <h2>회원 정보수정</h2>--%>
<%--        <form method="POST" action="/updateUser">--%>
<%--            <div>--%>
<%--                <label>id</label>    <input type="text" name="id" value="${dto.id}" readonly>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <label>비밀번호</label>    <input type="password" name="pwd">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <label>비밀번호 확인</label>    <input type="password" name="pwdchk">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <label>이름</label>    <input type="text" name="name" value="${dto.name}">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <label>E-mail</label>    <input type="text" name="email" value="${dto.email}">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <label>전화번호</label>   <input type="text" name="phone" value="${dto.phone}">--%>
<%--            </div>--%>
<%--            <div>${message}</div>--%>

<%--            <div>--%>
<%--                <input type="submit" value="수정"> <input type="button" onclick="history.back()" value="되돌아가기">--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<%@ include file="../footer.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<div class="mypage-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="content">
        <h2>회원 정보수정</h2>
        <form method="POST" action="/updateUser" class="mypage-form">
            <div>
                <label for="id">ID</label>
                <input type="text" name="id" id="id" value="${dto.id}" readonly>
            </div>
            <div>
                <label for="pwd">비밀번호</label>
                <input type="password" name="pwd" id="pwd">
            </div>
            <div>
                <label for="pwdchk">비밀번호 확인</label>
                <input type="password" name="pwdchk" id="pwdchk">
            </div>
            <div>
                <label for="name">이름</label>
                <input type="text" name="name" id="name" value="${dto.name}">
            </div>
            <div>
                <label for="email">E-mail</label>
                <input type="text" name="email" id="email" value="${dto.email}">
            </div>
            <div>
                <label for="phone">전화번호</label>
                <input type="text" name="phone" id="phone" value="${dto.phone}">
            </div>
            <div class="message">${message}</div>

            <div>
                <input type="submit" value="수정">
                <input type="button" onclick="history.back()" value="되돌아가기">
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp" %>
