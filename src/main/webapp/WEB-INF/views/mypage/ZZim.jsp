<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-zzim-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="mypage-zzim-content">
        <h2>찜목록</h2>
       <div class="mypage-zzim-items">
            <c:forEach items="${ZZim}" var="zzim">
                <div class="mypage-zzim-item">
                    <!-- 상품 상세 페이지로 이동 -->
                    <a href="/product/detail/${zzim.cseq}" class="zzim-link">
                        <div class="zzim-image">
                            <img src="/images/product/${empty zzim.image ? 'placeholder.jpg' : zzim.image}"
                                 alt="${zzim.title}" />
                        </div>
                        <div class="zzim-info">
                            <p>${zzim.title}</p>
                            <span>${zzim.price}원</span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
