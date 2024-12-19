
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>
        <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />
    <article>
        <div class="class-item" >
        <c:forEach items="${title}" var="qna">
            <div>
                <div>${qna.title}</div>
                <span>작성자</span><span>내용</span><span>작성일</span><span>답변자</span><span>내용</span><span>답변일</span>
                <c:forEach items="${content}" var="content">
                    <c:if test="${qna.cseq == content.cseq}">
                        <div>
                            <span>${content.userid}</span><span>${content.content}</span><span><fmt:formatDate value="${content.indate}"/></span>
                            <span>${content.businessid}</span><span>${content.reply}</span><span><fmt:formatDate value="${content.replyindate}"/></span>
                        </div>
                    </c:if>
                </c:forEach>

            </div>

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>