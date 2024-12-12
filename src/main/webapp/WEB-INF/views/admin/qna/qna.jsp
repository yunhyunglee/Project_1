

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>


<%--<h2>QnA 관리</h2>--%>


<%--<button onclick="filterQnA('writer1')">일반 사용자</button>--%>
<%--<button onclick="filterQnA('writer2')">사업자</button>--%>


<%--<div class="accordion-container">--%>
<%--    <c:forEach var="qna" items="${qnaList}">--%>
<%--        <div class="accordion-item">--%>
<%--            <!-- QnA 제목 -->--%>
<%--            <div class="accordion-header" onclick="toggleAccordion(this)">--%>
<%--                <span>${qna.title}</span>--%>
<%--                <span class="badge ${qna.reply != null ? 'badge-success' : 'badge-warning'}">--%>
<%--                        ${qna.reply != null ? '답변 완료' : '미답변'}--%>
<%--                </span>--%>
<%--            </div>--%>
<%--            <!-- QnA 상세 내용 -->--%>
<%--            <div class="accordion-content" style="display: none; animation: slideDown 0.3s;">--%>
<%--                <p><strong>내용:</strong> ${qna.content}</p>--%>
<%--                <p><strong>작성일:</strong> ${qna.indate}</p>--%>
<%--                <p><strong>작성자:</strong>--%>
<%--                        ${qna.writer1 != null ? qna.writer1 + '' : qna.writer2 + ''}--%>
<%--                </p>--%>


<%--                <p><strong>답변:</strong> ${qna.reply != null ? qna.reply : '아직 답변이 없습니다.'}</p>--%>
<%--                <!-- 답변 작성 -->--%>
<%--                <textarea id="reply-${qna.qseq}" rows="3" cols="50" placeholder="답변을 입력하세요"></textarea><br>--%>
<%--                <button class="btn-save" onclick="saveReply(${qna.qseq})">답변 저장</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>QnA 관리</h2>

<!-- 버튼으로 필터링 -->
<button onclick="filterQnA('writer1')">일반 사용자</button>
<button onclick="filterQnA('writer2')">사업자</button>

<div class="accordion-container">
    <c:forEach var="qna" items="${qnaList}">
        <div class="accordion-item" data-writer="${qna.writer1 != null ? 'writer1' : 'writer2'}">
            <!-- QnA 제목 -->
            <div class="accordion-header" onclick="toggleAccordion(this)">
                <span>${qna.title}</span>
                <span class="badge ${qna.reply != null ? 'badge-success' : 'badge-warning'}">
                        ${qna.reply != null ? '답변 완료' : '미답변'}
                </span>
            </div>
            <!-- QnA 상세 내용 -->
            <div class="accordion-content" style="display: none;">
                <p><strong>내용:</strong> ${qna.content}</p>
                <p><strong>작성일:</strong> ${qna.indate}</p>
                <p><strong>작성자:</strong>
                        ${qna.writer1 != null ? qna.writer1 : qna.writer2}
                </p>
                <p><strong>답변:</strong> ${qna.reply != null ? qna.reply : '아직 답변이 없습니다.'}</p>
                <!-- 답변 작성 -->
                <textarea id="reply-${qna.qseq}" rows="3" cols="50" placeholder="답변을 입력하세요"></textarea><br>
                <button class="btn-save" onclick="saveReply(${qna.qseq})">답변 저장</button>
            </div>
        </div>
    </c:forEach>
</div>

