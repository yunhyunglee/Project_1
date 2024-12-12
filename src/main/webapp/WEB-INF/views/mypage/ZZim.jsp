<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="mypage-zzim-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 본문 -->
    <div class="mypage-zzim-content">
        <h2>찜목록</h2>
<%--        <div class="mypage-zzim-items">--%>
<%--            <c:forEach items="${ZZim}" var="zzim">--%>
<%--                <div class="mypage-zzim-item">--%>
<%--                    <div class="zzim-image">--%>
<%--&lt;%&ndash;                        <img src="${zzim.image}" alt="${zzim.title}" />&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <!-- 이미지가 없는 경우 기본 이미지 출력 -->&ndash;%&gt;--%>
<%--                                <img src="/images/${empty zzim.image ? 'placeholder.jpg' : zzim.image}"--%>
<%--                                     alt="${zzim.title}" />--%>
<%--                    </div>--%>
<%--                    <div class="zzim-info">--%>
<%--                        <p>${zzim.title}</p>--%>
<%--                        <span>${zzim.price}원</span>--%>
<%--&lt;%&ndash;                        <button class="wishlist-btn" onclick="toggleHeart(this, ${zzim.id})">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <i class="fi ${zzim.isWishlisted ? 'fi-ss-heart' : 'fi-rs-heart'}"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </button>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
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
