<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/script/admin-product.js"></script>

<h2>클래스 관리</h2>

<h2>클래스 관리</h2>

<!-- 검색어 입력 및 버튼 -->
<input type="text" id="searchInput" placeholder="검색하려는 클래스정보를 입력해주세요." style="width:40%;">
<button type="button" onclick="searchProducts()">검색</button>





<table border="1">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>가격</th>
        <th>카테고리</th>
        <th>이미지</th>
        <th>사업자</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.cseq}</td>
            <td>${product.title}</td>
            <td>${product.content}</td>
            <td>${product.price}</td>
            <td>
                <c:choose>
                    <c:when test="${product.category == 1}">베이킹</c:when>
                    <c:when test="${product.category == 2}">공 예</c:when>
                    <c:when test="${product.category == 3}">요 리</c:when>
                    <c:when test="${product.category == 4}">스포츠</c:when>
                    <c:when test="${product.category == 5}">뷰 티</c:when>
                    <c:otherwise>기타</c:otherwise>
                </c:choose>
            </td>
            <td><img src="${product.image}" width="100" height="100"></td>
            <td>${product.id}</td>
            <td><button onclick="deleteProduct(${product.cseq})">삭제</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="pagination">
    <c:if test="${paging.prev}">
        <a href="#" onclick="goToPageP(${paging.beginPage - 1})">◀</a>
    </c:if>
    <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
        <a href="#" onclick="goToPageP(${index})" class="${index == paging.page ? 'active' : ''}">${index}</a>
    </c:forEach>
    <c:if test="${paging.next}">
        <a href="#" onclick="goToPageP(${paging.endPage + 1})">▶</a>
    </c:if>
</div>



