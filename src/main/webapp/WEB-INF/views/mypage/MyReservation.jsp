
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" >
        <c:forEach items="${MyReservation}" var="plan">
            <div>

                <div>
                     <h2>${plan.title}</h2>
                    <h3>신청인원 : ${plan.people}</h3>
                    <h3>금액 :  ${plan.totalprice} </h3>
                    예약시간 : <fmt:formatDate value="${plan.classday}"/>
                     <fmt:formatDate value="${plan.classtime}" pattern="HH:mm"/>
                    <input type="button" name="cancle" value="예약 취소" onclick="location.href='reservation_cancle?reseq='+${plan.reseq}"/>
                </div>
		    </div>

        </c:forEach>
        <input type="textbutton" value="되돌아가기" onclick="history.back()"/>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>