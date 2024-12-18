
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

    <article>
        <div class="class-item" >
        <c:forEach items="${MyClass}" var="myclass">
            <div>
                ${myclass.title}  <input type="button" value="정보수정하기" onclick="location.href='ClassinfoUpdate?cseq='+${myclass.cseq}">
                <input type="button" value="예약관리하기" onclick="location.href='Reservation_List?cseq=${myclass.cseq}'">
                정산 금액:<fmt:formatNumber value="${myclass.totalprice}" type="currency"/>
                <input type="button" value="정산하기" id="clearpay" data-cseq="${myclass.cseq}">
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

        </c:forEach>
        </div>
    </article>

</section>

<%@ include file="../footer.jsp" %>