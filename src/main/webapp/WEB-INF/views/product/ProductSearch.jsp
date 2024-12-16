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

    <div class="paging">
        <!-- prev 버튼의 표시 여부 -->
        <c:if test="${paging.prev}" >
        <a href="search?page=${paging.beginPage-1}" style="text-decoration: none">◀</a>&nbsp;
        </c:if>

        <!--  beginPage 부터  endPage 까지 일렬로 페이지를 표시 -->
        <c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
        <c:choose>
            <c:when test="${index==paging.page}" >${index}</c:when>
        <c:otherwise>
        <a href="search?page=${index}" style="text-decoration: none">
            &nbsp;${index}&nbsp;
        </a>
        </c:otherwise>
        </c:choose>
        </c:forEach>

        <!-- next 버튼 표시 여부 -->
        <c:if test="${paging.next}" >
        <a href="search?page=${paging.endPage+1}">▶</a>&nbsp;
        </c:if>
    </div>



</section>


<%@ include file="../footer.jsp" %>