<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<section>
    <h4>검색결과</h4>
    <div class="categoryproducts">
        <c:if test="${not empty SearchProduct}">
            <c:forEach items="${SearchProduct}" var="productVo">
                <div class="categoryitem" onclick="location.href='/productDetail?id=${productVo.cseq}'">
                    <div class="image-wrapper">
                        <img src="/images/${productVo.image}" alt="${productVo.title}" />
                    </div>
                    <div class="address">${productVo.address1}</div>
                    <div class="title">${productVo.title}</div>
                    <div class="pricing">
                        <div class="price">${productVo.price}원</div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty SearchProduct}">
            <div>현재 표시할 상품이 없습니다.</div>
        </c:if>
    </div>
</section>


<%@ include file="../footer.jsp" %>