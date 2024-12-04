
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" style="display: flex ;">
        <c:forEach items="${ZZim}" var="zzim">
            <div>
                <div><img src="http://placehold.co/200x200" /></div>
                <div>
                     ${zzim.title} <br>
                     ${zzim.price} <br>
                </div>
		    </div>

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>