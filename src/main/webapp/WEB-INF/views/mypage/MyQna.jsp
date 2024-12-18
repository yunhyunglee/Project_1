
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<%--<section>--%>

<%--    <article>--%>
<%--        <div class="item" style="display: flex ;flex-direction: column">--%>
<%--        <c:forEach items="${MyQna}" var="qna">--%>
<%--            <div>--%>

<%--                <div>--%>
<%--                     <p>${qna.title}</p>--%>
<%--                    <p>${qna.content}</p>--%>
<%--                    <p>${qna.reply}</p>--%>
<%--                </div>--%>
<%--		    </div>--%>

<%--        </c:forEach>--%>
<%--        </div>--%>
<%--    </article>--%>

<%--</section>--%>
<head>
    <meta charset="UTF-8">
    <title>사업자 Q&A 목록</title>
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
</head>
<div class="mypage-container">
        <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

        <!-- Q&A 콘텐츠 -->
        <div class="content mypage-qna-content">
            <h2 class="mypage-qna-title">사업자 Q&A 목록</h2>
            <ul class="mypage-qna-list">
                <c:forEach items="${MyQna}" var="qna">
                    <li class="mypage-qna-item">
                        <p class="qna-title">제목: ${qna.title}</p>
                        <p>내용: ${qna.content}</p>
                        <p class="qna-reply">답변: ${qna.reply}</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

<%@ include file="../footer.jsp" %>



