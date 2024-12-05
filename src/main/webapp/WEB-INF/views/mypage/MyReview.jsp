
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" style="display: flex ;">
        <c:forEach items="${MyReview}" var="review">
            <div>

                <div>
                     <h2>${review.title}</h2> <br>
                    <h3>${review.content}</h3> <br>
                </div>
		    </div>

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>