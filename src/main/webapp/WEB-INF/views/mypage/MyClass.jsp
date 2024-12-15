
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language="JavaScript">
    document.addEventListener('DOMContentLoaded',function(){
        document.querySelectorAll('input[id^="clearpay"]').forEach(function(item) { // 'item'이라는 변수 이름 사용
            item.addEventListener('click', function() {
                var ans = confirm("금액을 정산하시겠습니까?");
                if (ans) {
                    var cseq = this.getAttribute('data-cseq');
                    location.href="clearpay?cseq="+cseq;
                    alert("정산신청 완료");
                }
            });
        });
    });
</script>
<section>

    <article>
        <div class="item" >
            <div onclick="location.href='NewProduct'">새 클래스 만들기</div>
        <c:forEach items="${MyClass}" var="myclass">
            <div>
                ${myclass.title}  <input type="button" value="정보수정하기" onclick="location.href='ClassinfoUpdate?cseq='+${myclass.cseq}">
                <input type="button" value="예약관리하기" onclick="location.href='Reservation_List?cseq=${myclass.cseq}'">
                정산 금액:<fmt:formatNumber value="${myclass.totalprice}" type="currency"/>
                <input type="button" value="정산하기" id="clearpay" data-cseq="${myclass.cseq}">
            </div>
        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>