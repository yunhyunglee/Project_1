<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>
<!-- 이미지 슬라이더 -->
<div id="main_img_slider">
    <div class="slider">
        <!-- 슬라이드 항목 -->
        <div class="slide">
            <img src="/images/banner/001.png" alt="Slide 1">
        </div>
        <div class="slide">
            <img src="/images/banner/002.png" alt="Slide 2">
        </div>
        <div class="slide">
            <img src="/images/banner/003.png" alt="Slide 3">
        </div>
    </div>
    <!-- 화살표 버튼 -->
    <button class="arrow prev" id="prevBtn">‹</button>
    <button class="arrow next" id="nextBtn">›</button>
</div>


<div id="menu">

	<a href="theme?theme=1">
<!-- 		<img src="http://placehold.co/90"> -->
    <img src="images/christmas-tree.gif">
	</a>
	<a href="theme?theme=2">
<%--		<img src="http://placehold.co/90">--%>
        <img src="images/male.gif">
	</a>
	<a href="theme?theme=3">
<%--		<img src="http://placehold.co/90">--%>
        <img src="images/family.gif">
	</a>
</div>

<!-- BEST 섹션 -->
<div id="BestItem">
    <h2>Best</h2>
    <div class="products">
        <c:if test="${not empty bestProducts}">
            <c:forEach begin="1" end="4" var="index">
                <c:choose>
<%--                    <!-- 리스트의 크기와 index를 비교 -->--%>
                    <c:when test="${index <= bestProducts.size()}">
                        <c:set var="product" value="${bestProducts[index-1]}" />
                        <div class="item">
                            <a href="/productDetail?id=${product.cseq}">
<%--                                <!-- 이미지가 없는 경우 기본 이미지 출력 -->--%>
<%--                                <img src="/images/product/${empty product.image ? 'placeholder.jpg' : product.image}"--%>
<%--                                     alt="${product.title}" />--%>
<%--                                <img src="webapp/product_images/${productVo.image}" alt="${productVo.title}" />--%>

                                    <img src="product_images/${product.savefilename}" alt="${product.title}" />
                                <p>${product.title}</p>
                                <p>${product.price}원</p>
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="item">
                            <a href="#">
                                <img src="http://placehold.co/250x250" alt="No Product" />
                                <p>상품 준비 중</p>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>
    </div>
</div>

<!-- NEW 섹션 -->
<div id="NewItem">
    <h2>New</h2>
    <div class="products">
        <c:if test="${not empty newProducts}">
            <c:forEach begin="1" end="4" var="index">
                <c:choose>
<%--                    <!-- 리스트의 크기와 index를 비교 -->--%>
                    <c:when test="${index <= newProducts.size()}">
                        <c:set var="product" value="${newProducts[index-1]}" />
                        <div class="item">
                            <a href="/productDetail?id=${product.cseq}">
<%--                                <!-- 이미지가 없는 경우 기본 이미지 출력 -->--%>
                                    <img src="/product_images/${product.savefilename}" alt="${product.title}" />
                                <p>${product.title}</p>
                                <p>${product.price}원</p>
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="item">
                            <a href="#">
                                <img src="http://placehold.co/250x250" alt="No Product" />
                                <p>상품 준비 중</p>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>
    </div>
</div>


<%@ include file="footer.jsp" %>