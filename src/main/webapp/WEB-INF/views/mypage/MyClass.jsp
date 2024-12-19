
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language="JavaScript">
    document.addEventListener('DOMContentLoaded',function(){
        document.querySelectorAll('button[id="myclass-clear-btn"]').forEach(function(item) { // 'item'이라는 변수 이름 사용
            item.addEventListener('click', function() {
                var ans = confirm("금액을 정산하시겠습니까?");
                if (ans) {
                    var cseq = this.getAttribute('data-cseq');
                    location.href="clearpay?cseq="+cseq;
                    alert("정산신청 완료");
                }
            });
        });
        $('#replybutton').on('click', function() {
            const form=$(this).closest('form')[0];
            console.log(form);
            const formdata = new FormData(form);
            $.ajax({
                url: "QnaproductReply",
                type: "post",
                data: formdata,
                processData: false,
                contentType: false,
                success: function () {
                    location.reload();
                }
            });
        });

            // 드롭다운 기능 구현


    });
    function toggleReviewContent(cseq) {
        $('#QnaProduct' + cseq).css('display', function(_, display) {
            return display === 'block' ? 'none' : 'block';
        });
    }

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
            <c:forEach items="${productlist}" var="myclass">
                <div class="myclass-item">
                    <a onclick="location.href='/productDetail?id=${myclass.cseq}'">
                        <div class="myclass-title">${myclass.title}</div>
                    </a>

                    <div class="myclass-details">
                        <div class="myclass-amount">
                            <span class="myclass-amount-icon">&#128176;</span> <!-- 💱 아이콘 -->
                            <c:forEach items="${reservationList}" var="reservationList">
                                <c:if test="${myclass.cseq == reservationList.cseq}"><span>정산 금액: ${reservationList.totalprice} 원</span></c:if>
                                <c:if test="${empty reservationList}"><span>정산 금액: 0 원</span></c:if>
                            </c:forEach>
                        </div>
                        <div>
                            <button class="myclass-btn" onclick="location.href='ClassinfoUpdate?cseq=${myclass.cseq}'">클래스 정보 수정</button>
                            <button class="myclass-btn" onclick="location.href='Reservation_List?cseq=${myclass.cseq}'">예약 관리</button>
                            <button class="myclass-btn myclass-clear-btn" id="myclass-clear-btn" data-cseq="${myclass.cseq}">정산하기</button>
                            <input type="button" class="myclass-btn" name="MyQnaproduct" id="MyQnaproduct" value="문의내용 " onclick="toggleReviewContent('${myclass.cseq}')">

                        </div>
                    </div>
                    <div id="QnaProduct${myclass.cseq}" data-userid="${loginUser.id}" style="display: none; flex: 1">
                        <div style="display: flex; align-items: center; justify-content: center;">
                                <div style="flex: 1">작성자</div><div style="flex: 3">내용</div><div style="flex: 1">작성일시</div>
                        </div>
                        <div>
                                <c:forEach items="${qna}" var="qna">
                                    <c:if test="${qna.cseq == myclass.cseq}">
                                    <div style="display: flex; align-items: center; justify-content: center;">
                                        <div style="flex: 1">${qna.userid}</div>
                                        <div style="flex: 3">${qna.content}</div>
                                        <div style="flex: 1"><fmt:formatDate value="${qna.indate}"/></div>
                                    </div>
                                        <c:choose>
                                            <c:when test="${empty qna.reply}">
                                                <div>
                                                    <form>
                                                        <input type="hidden" name="qpseq" value="${qna.qpseq}">
                                                        <textarea name="qnareply" id="qnareply"></textarea>
                                                        <input type="button" name="replybutton" id="replybutton" value="답변올리기">
                                                    </form>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                               <div style="display: flex; align-items: center; justify-content: center;">
                                                    <div style="flex: 1"></div>
                                                    <div style="flex: 3">${qna.reply}</div>
                                                    <div style="flex: 1"><fmt:formatDate value="${qna.replyindate}"/></div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>



<%@ include file="../footer.jsp" %>