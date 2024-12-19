
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<style>
    /* 고유한 Q&A 스타일 */
    .mypage-qna-content {
        flex-grow: 1;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .mypage-qna-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 15px;
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

    .mypage-qna-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .mypage-qna-item {
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 15px;
        margin-bottom: 15px;
        background-color: #f9f9f9;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .mypage-qna-item:hover {
        background-color: #fdfdfd;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .mypage-qna-item p {
        margin: 5px 0;
        color: #555;
    }

    .mypage-qna-item .qna-title {
        font-weight: bold;
        color: #333;
    }

    .mypage-qna-item .qna-reply {
        color: #19A7CE;
        font-weight: bold;
    }
</style>
<div class="mypage-container">
  <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />
    <div class="content mypage-qna-content">

        <c:forEach items="${title}" var="qna">
                <div  class="mypage-qna-title">${qna.title}</div>
                <div class="reservation-list-header">
                <div style="flex: 1">작성자</div><div style="flex: 1">내용</div><div style="flex: 1">작성일</div><div style="flex: 1">답변자</div><div style="flex: 1">내용</div><div style="flex: 1">답변일</div>
                </div>
                    <ul class="mypage-qna-list">
                        <c:forEach items="${content}" var="content">
                            <c:if test="${qna.cseq == content.cseq}">
                               <li class="mypage-qna-item" style="display: flex">
                                    <div style="flex: 1">${content.userid}</div><div style="flex: 1">${content.content}</div><div style="flex: 1"><fmt:formatDate value="${content.indate}"/></div>
                                    <div style="flex: 1">${content.businessid}</div><div style="flex: 1">${content.reply}</div><div style="flex: 1"><fmt:formatDate value="${content.replyindate}"/></div>
                               </li>
                            </c:if>
                        </c:forEach>
                    </ul>

        </c:forEach>



    </div>
</div>
<%@ include file="../footer.jsp" %>