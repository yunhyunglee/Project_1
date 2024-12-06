<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 화면이동없이 서버와 데이터를 주고 받을 수 있는 환경을 제공합니다	-->
<script type="text/javascript">
    function replaceDivWithInput(id) {
        var div = document.getElementById(id);
        var input = document.createElement('input');
        input.type = 'text';
        input.value = div.innerHTML;
        input.style.width = "100px";
        div.parentNode.replaceChild(input, div);
    }
    function replaceInputWithDiv(id) {
        var input = document.getElementById(id);
        var div = document.createElement('div');
        div.id = id;
        div.innerHTML = input.value;
        input.parentNode.replaceChild(div, input);
    }

</script>
<div>
    <div style="display: flex; align-items: center; justify-content: space-around;">
        <div>예약자</div><div>인원수</div><div>예약일</div><div>예약시간</div><div>현황</div><div>변경</div>
    </div>
    <c:forEach items="${reservList}" var="list" varStatus="status">
        <div style="display: flex; align-items: center; justify-content: space-around; ">
            <input type="hidden" value="1" id="state${status.index}">

            <div id="userid${status.index}">${list.userid}</div><div id="people${status.index}">${list.people}</div>
            <div id="classday${status.index}">${list.classday}</div>
            <div id="classtime${status.index}">${list.classtime}</div>
            <c:choose>
                <c:when test="${list.endedclass=='N'}">
                    <div></div>
                </c:when>
                <c:otherwise>
                    <div> 완료 </div>
                </c:otherwise>
            </c:choose>
            <div><input type="button" value="취소" onclick="location.href='reservation_cancle?reseq=${list.reseq}'"></div>
        </div>
    </c:forEach>

</div>

<%@ include file="../footer.jsp" %>
