<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../customer_header.jsp" %>
<div id="wrap">
<%--<header>--%>

<%--    <div class="logo">오늘배움 고객센터</div>--%>
<%--    <div class="header-right">--%>
<%--        <a href="/">메인으로</a>--%>
<%--    </div>--%>
<%--</header>--%>

    <script>
        document.addEventListener('DOMContentLoaded', function(event) {
            document.getElementById("search").addEventListener('click', function() {
                document.customer.submit();
            });
            document.getElementsByName("write")[0].addEventListener('click', function() {
                location.href="QnaWrite";
            });
        });
    </script>
    <main>
        <section class="main-banner">
            <h1>고객센터<br>무엇을 도와드릴까요?</h1>
            <form action="customer" method="get" name="customer">
            <div class="cus-search-bar">
                <input type="text" placeholder=" 검색ㄱㄱ" name="key">
                <button id="search">검색</button>
            </div>
            <div class="keyword">
                <span>추천 키워드</span>
                <a href="#">비밀번호 변경</a>
                <a href="#">클래스 예약날짜 변경</a>
                <a href="#">환불처리</a>
            </div>
        </section>
        <section class="question">
            <div class="question-bar" onclick="toggleFAQ()">
                <h3>자주 묻는 질문</h3>
                <span class="arrow">▼</span>
            </div>
            <ul class="question-list" id="questionList">
                <li><a href="#">회원 가입은 어떻게 하나요?</a></li>
                <li><a href="#">비밀번호를 잊어버렸어요.</a></li>
                <li><a href="#">계정을 삭제하고 싶어요.</a></li>
                <li><a href="#">예약 날짜를 변경하고 싶어요.</a></li>
            </ul>
            <c:if test="${not empty loginUser}">
                <input type="button" name="write" value="문의하기">
            </c:if>
            <hr>
            <div style="display: flex;justify-content: space-between;align-items: center;">
                <div>번호</div><div>제목</div><div>글쓴이</div><div>작성일</div>
            </div><hr>

            <c:forEach items="${qnaList}" var="qna">
            <div style="display: flex;justify-content: space-between;align-items: center;">
                <div>${qna.qseq}</div>
                <div><a href="QnaDetail?qseq=${qna.qseq}">${qna.title}</a></div>
                <c:if test="${empty qna.writer1}">
                    <div>${qna.writer2}</div>
                </c:if>
                <c:if test="${empty qna.writer2}">
                    <div>${qna.writer1}</div>
                </c:if>
                <div><fmt:formatDate value="${qna.indate}" /></div>
            </div>
            <hr>
            </c:forEach>

            <div class="paging">
		<!-- prev 버튼의 표시 여부 -->
		<c:if test="${paging.prev}" >
			<a href="customer?qnapage=${paging.beginPage-1}" style="text-decoration: none">◀</a>&nbsp;
		</c:if>

		<!--  beginPage 부터  endPage 까지 일렬로 페이지를 표시 -->
		<c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
		    <c:choose>
                <c:when test="${index==paging.page}" >${index}</c:when>
                <c:otherwise>
                    <a href="customer?qnapage=${index}" style="text-decoration: none">
                        &nbsp;${index}&nbsp;
                    </a>
                </c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- next 버튼 표시 여부 -->
		<c:if test="${paging.next}" >
			<a href="customer?qnapage=${paging.endPage+1}">▶</a>&nbsp;
		</c:if>
        </form>

        </section>
    </main>
</div>

<%@ include file="../footer.jsp" %>
