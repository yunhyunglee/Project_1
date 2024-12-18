
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<section>--%>

<%--    <article>--%>
<%--        <div class="item" style="display: flex ;">--%>
<%--        <c:forEach items="${MyReservation}" var="plan">--%>
<%--            <div>--%>

<%--                <div>--%>
<%--                     <h2>${plan.title}</h2>--%>
<%--                    <h3>신청인원 : ${plan.people}</h3>--%>
<%--                    <h3>금액 :  ${plan.totalprice} </h3>--%>
<%--                    <h3>예약시간 : <fmt:formatDate value="${plan.classday}"/>  ${plan.classtime}</h3>--%>
<%--                </div>--%>
<%--		    </div>--%>

<%--        </c:forEach>--%>
<%--        </div>--%>
<%--    </article>--%>

<%--</section>--%>

<%--<%@ include file="../footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
    $('.cancel-btn').click(function(){
        $.ajax({
            url :"revCancle",
            data: {reseq : $(this).data('reseq')},
        });
    });
</script>

<div class="mypage-container">
    <!-- 사이드바 -->
    <jsp:include page="../sidebar.jsp" />


    <!-- 본문 영역 -->
    <section class="mypage-reservation-section">
        <h2 class="section-title">내 예약 내역</h2>
        <div class="reservation-container">
            <c:forEach items="${MyReservation}" var="reservation">
                <div class="reservation-card">
                    <div class="reservation-content">
                        <h3 class="reservation-title">${reservation.title}</h3>
                        <p><strong>신청인원:</strong> ${reservation.people}명</p>
                        <p><strong>금액:</strong> ${reservation.totalprice}원</p>
                        <p><strong>예약시간:</strong>
                            <fmt:formatDate value="${reservation.classday}" pattern="yyyy-MM-dd"/> ${reservation.classtime}
                        </p>
                    </div>
                    <button class="cancel-btn" data-reseq="${reservation.reseq}">취소하기</button>
                </div>
            </c:forEach>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>
