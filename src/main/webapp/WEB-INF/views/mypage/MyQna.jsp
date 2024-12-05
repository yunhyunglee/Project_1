
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" style="display: flex ;flex-direction: column">
        <c:forEach items="${MyQna}" var="qna">
            <div>

                <div>
                     <p>${qna.title}</p>
                    <p>${qna.content}</p>
                    <p>${qna.reply}</p>
                </div>
		    </div>

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>