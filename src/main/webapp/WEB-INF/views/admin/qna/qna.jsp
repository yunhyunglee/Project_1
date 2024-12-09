<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>QnA 관리</h2>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>질문</th>
        <th>작성일</th>
        <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="qna" items="${qnaList}">
        <tr>
            <td>${qna.qseq}</td>
            <td>${qna.title}</td>
            <td>${qna.indate}</td>
            <td>
                <c:choose>
                    <c:when test="${qna.writer1 != null}">
                        개인: ${qna.writer1}
                    </c:when>
                    <c:when test="${qna.writer2 != null}">
                        사업자: ${qna.writer2}
                    </c:when>
                    <c:otherwise>
                        작성자 없음
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
