
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" style="display: flex ;">
        <c:forEach items="${MyReservation}" var="plan">
            <div>

                <div>
                     <h2>${plan.title}</h2>
                    <h3>신청인원 : ${plan.people}</h3>
                    <h3>금액 :  ${plan.totalprice} </h3>
                    <h3>예약시간 : <fmt:formatDate value="${plan.classday}"/>  ${plan.classtime}</h3>
                </div>
		    </div>

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>