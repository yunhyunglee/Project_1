<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<script language="JavaScript">
    document.addEventListener("DOMContentLoaded",function(){
        document.getElementById("update").addEventListener("click",function(){
            location.href="updateQna?qseq=${qnavo.qseq}";
        });
        document.getElementById("delete").addEventListener("click",function(){
            var ans=confirm("삭제합니까?");
            if(ans) {
                location.href = "deleteQna?qseq=${qnavo.qseq}";
            }
        });

    });

</script>

<div>
    <div>${qnavo.title}</div>
    <c:choose>
        <c:when test="${not empty loginUser1}">
            <div>${qnavo.writer1}</div>
        </c:when>
        <c:otherwise>
            <div>${qnavo.writer2}</div>
        </c:otherwise>
    </c:choose>
    <div><fmt:formatDate value="${qnavo.indate}" pattern="yy.MM.dd HH:mm"/> </div>
    <div>${qnavo.content}</div>
    <div>${qnavo.reply}</div>

    <c:if test="${(loginUser1 eq qnavo.writer1) and (loginUser2 eq qnavo.writer2)}">
        <input type="button" value="수정" id="update">
        <input type="button" value="삭제" id="delete">
    </c:if>
    <input type="button" value="목록" onclick="location.href='customer'">
</div>
<%@ include file="../footer.jsp" %>
