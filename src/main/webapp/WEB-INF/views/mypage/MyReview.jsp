
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" style="display: flex ;">
        <c:forEach items="${MyReview}" var="review">
            <div>

                <div>
                     ${review.title} <br>
                     ${review.content} <br>
                </div>
		    </div>

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>