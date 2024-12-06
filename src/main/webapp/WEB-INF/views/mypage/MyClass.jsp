
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="item" >
        <c:forEach items="${MyClass}" var="myclass">
            <div>
                <div>
                     <p>${myclass.title}</p>  <input type="button" value="정보수정하기" onclick="location.href=''">
                    <input type="button" value="예약관리하기" onclick="location.href=''">
                    <p>정산 금액:<fmt:formatNumber value="${myclass.totalprice}" type="currency"/> </p> <input type="button" value="정산하기" onclick="location.href=''">
                </div>
		    </div>
        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>