<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>


<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--<!-- 화면이동없이 서버와 데이터를 주고 받을 수 있는 환경을 제공합니다	-->--%>
<%--<script type="text/javascript">--%>
<%--    function replaceDivWithInput(id) {--%>
<%--        var div = document.getElementById(id);--%>
<%--        var input = document.createElement('input');--%>
<%--        input.type = 'text';--%>
<%--        input.value = div.innerHTML;--%>
<%--        input.style.width = "100px";--%>
<%--        div.parentNode.replaceChild(input, div);--%>
<%--    }--%>
<%--    function replaceInputWithDiv(id) {--%>
<%--        var input = document.getElementById(id);--%>
<%--        var div = document.createElement('div');--%>
<%--        div.id = id;--%>
<%--        div.innerHTML = input.value;--%>
<%--        input.parentNode.replaceChild(div, input);--%>
<%--    }--%>

<%--</script>--%>
<%--<div>--%>
<%--    <div style="display: flex; align-items: center; justify-content: space-around;">--%>
<%--        <div>예약자</div><div>인원수</div><div>예약일</div><div>예약시간</div><div>현황</div><div>변경</div>--%>
<%--    </div>--%>
<%--    <c:forEach items="${reservList}" var="list" varStatus="status">--%>
<%--        <div style="display: flex; align-items: center; justify-content: space-around; ">--%>
<%--            <input type="hidden" value="1" id="state${status.index}">--%>

<%--            <div id="userid${status.index}">${list.userid}</div><div id="people${status.index}">${list.people}</div>--%>
<%--            <div id="classday${status.index}">${list.classday}</div>--%>
<%--            <div id="classtime${status.index}">${list.classtime}</div>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${list.endedclass=='N'}">--%>
<%--                    <div></div>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <div> 완료 </div>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--                    <div>--%>
<%--                      <input type="button" value="취소"--%>
<%--                             onclick="confirm('정말 취소하시겠습니까?') ? location.href='reservation_cancle?reseq=${list.reseq}' : ''">--%>
<%--                    </div>--%>

<%--    </c:forEach>--%>

<%--</div>--%>
<%--<div>--%>
<%--    <input type="button" value="되돌아가기" onclick="history.back()">--%>
<%--</div>--%>

<%--<%@ include file="../footer.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    function replaceDivWithInput(id) {
        var div = document.getElementById(id);
        var input = document.createElement('input');
        input.type = 'text';
        input.value = div.innerHTML.trim();
        input.style.width = "100px";
        input.id = id;
        div.parentNode.replaceChild(input, div);
    }

    function replaceInputWithDiv(id) {
        var input = document.getElementById(id);
        var div = document.createElement('div');
        div.id = id;
        div.innerHTML = input.value.trim();
        input.parentNode.replaceChild(div, input);
    }
</script>
<style>
    /* 전체 컨테이너 */
    .business-reservation-container {
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        margin: 20px auto;
        max-width: 900px;
    }

    /* 제목 스타일 */
    .section-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
        color: #333;
    }

    /* 리스트 헤더 스타일 */
    .reservation-list-header {
        display: flex;
        justify-content: space-around;
        font-weight: bold;
        padding: 10px 0;
        border-bottom: 2px solid #ddd;
        margin-bottom: 10px;
    }

    /* 리스트 행 스타일 */
    .reservation-list-row {
        display: flex;
        justify-content: space-around;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #eee;
        transition: background-color 0.3s ease;
    }

    .reservation-list-row:hover {
        background-color: #f9f9f9;
    }

    /* 되돌아가기 버튼 스타일 */
    .back-button-container {
        margin-top: 20px;
        text-align: center;
    }

    .back-button-container input {
        padding: 10px 20px;
        font-size: 1rem;
        border: none;
        border-radius: 6px;
        background-color: #6c757d;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .back-button-container input:hover {
        background-color: #5a6268;
    }

</style>

<!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />
<div class="business-reservation-container">

    <!-- 제목 -->
    <h2 class="section-title">예약 관리</h2>

    <!-- 헤더 영역 -->
    <div class="reservation-list-header">
        <div>예약자</div>
        <div>인원수</div>
        <div>예약일</div>
        <div>예약시간</div>
        <div>현황</div>
        <div>변경</div>
    </div>

    <!-- 예약 리스트 -->
    <c:forEach items="${reservList}" var="list" varStatus="status">
        <div class="reservation-list-row">
            <input type="hidden" value="1" id="state${status.index}">

            <!-- 예약자 정보 -->
            <div id="userid${status.index}">${list.userid}</div>
            <div id="people${status.index}">${list.people}</div>
            <div id="classday${status.index}">${list.classday}</div>
            <div id="classtime${status.index}">${list.classtime}</div>

            <!-- 현황 -->
            <c:choose>
                <c:when test="${list.endedclass == 'N'}">
                    <div></div>
                </c:when>
                <c:otherwise>
                    <div>완료</div>
                </c:otherwise>
            </c:choose>

            <!-- 변경 버튼 -->
            <div>
                <input type="button" value="취소"
                    onclick="confirm('정말 취소하시겠습니까?') ? location.href='reservation_cancle?reseq=${list.reseq}' : ''">
            </div>
        </div>
    </c:forEach>

    <!-- 되돌아가기 버튼 -->
    <div class="back-button-container">
        <input type="button" value="되돌아가기" onclick="history.back()">
    </div>
</div>

<%@ include file="../footer.jsp" %>
