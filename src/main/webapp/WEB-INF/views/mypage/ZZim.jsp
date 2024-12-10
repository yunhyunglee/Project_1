<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<div class="mypage-zzim-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="mypage-zzim-content">
        <h2>찜목록</h2>
        <div class="mypage-zzim-item">
            <c:forEach items="${ZZim}" var="zzim">
                <div>
                    <div><img src="http://placehold.co/200x200" alt="${zzim.title}" /></div>
                    <div>
                        <p>${zzim.title}</p>
                        <span>${zzim.price}</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
