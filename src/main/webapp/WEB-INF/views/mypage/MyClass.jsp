
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
        document.replybutton.addEventListener('click', function() {
            location.href="QnaproductReply"
        });

    });
</script>

<div class="mypage-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

   <!-- 본문 -->
    <div class="mypage-myclass-content">
        <h2 class="myclass-section-title">내 클래스 목록</h2>

        <!-- 새 클래스 만들기 버튼 -->
        <div class="myclass-create-btn-container">
            <button class="myclass-create-btn" onclick="location.href='NewProduct'">새로운 클래스 개설</button>
        </div>

        <!-- 내 클래스 목록 -->
        <div class="myclass-list-container">
            <c:forEach items="${MyClass}" var="myclass">
               <div class="myclass-item">
                    <div class="myclass-title">${myclass.title}</div>
                    <div class="myclass-details">
                        <div class="myclass-amount">
                            <span class="myclass-amount-icon">&#128176;</span> <!-- 💱 아이콘 -->
                            <span>정산 금액: ${myclass.totalprice} 원</span>
                        </div>
                        <div>
                            <button class="myclass-btn" onclick="location.href='ClassinfoUpdate?cseq=${myclass.cseq}'">정보 수정</button>
                            <button class="myclass-btn" onclick="location.href='Reservation_List?cseq=${myclass.cseq}'">예약 관리</button>
                            <button class="myclass-btn myclass-clear-btn" data-cseq="${myclass.cseq}">정산하기</button>
                          <input type="button" name="MyQnaproduct" value="문의내용 ">
                            <div id="QnaProduct" data-userid="${loginUser.id}">

                                <c:forEach items="${qna}" var="qna">
                                 <c:if test="${qna.cseq==myclass.cseq}">

                                   <span>${qna.userid}</span> <span>${qna.content}</span> <span>${qna.indate}</span>
                                   <c:if test="${empty qna.reply}">
                                   <div>
                                       <form >
                                           <input type="hidden" name="qpseq" value="${qna.qpseq}">
                                           <textarea name="qnareply" id="qnareply"></textarea>
                                           <input type="button" name="replybutton" id="replybutton" value="답변올리기">
                                       </form>
                                   </div>
                                   </c:if>
                                   <c:if test="${not empty qna.reply}"><div>${qna.reply} / ${qna.replyindate}</div></c:if>
                                 </c:if>
                                </c:forEach>
                            </div>
                          </div>
                        </div>
                    </div>
               </div>

        </c:forEach>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>