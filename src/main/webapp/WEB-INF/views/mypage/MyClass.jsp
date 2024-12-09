
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" >
            <div onclick="location.href='NewProduct'">새 클래스 만들기</div>
        <c:forEach items="${MyClass}" var="myclass">
            <div>
                 <p>${myclass.title}</p>  <input type="button" value="정보수정하기" onclick="location.href='ClassinfoUpdate?cseq='+${myclass.cseq}">
                <input type="button" value="예약관리하기" onclick="location.href='Reservation_List?cseq=${myclass.cseq}'">
                <p>정산 금액:<fmt:formatNumber value="${myclass.totalprice}" type="currency"/> </p> <input type="button" value="정산하기" onclick="location.href=''">
            </div>
        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>