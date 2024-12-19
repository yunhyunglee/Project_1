<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<h2>예약 관리</h2>

<input type="text" id="searchInput" placeholder="검색하려는 예약정보를 입력해주세요."
      style="width:40%;" />
<button onclick="onSearchButtonClick()">검색</button>



<!-- 필터 버튼 -->
<div class="tabs">
    <div class="tab active" onclick="filterReservations('')">전체</div>
    <div class="tab" onclick="filterReservations('Y')">정산 완료</div>
    <div class="tab" onclick="filterReservations('N')">정산 대기중</div>
</div>


<!-- 예약 리스트 테이블 -->
<table border="1">
<thead>
<tr>
    <th>예약 번호</th>
    <th>사용자 ID</th>
    <th>클래스 제목</th>
    <th>예약 인원</th>
    <th>예약 날짜/시간</th>
    <th>정산 상태</th>
    <th>클래스 상태</th>
    <th>삭제</th>
</tr>
</thead>
<tbody id="reservationTableBody">
<c:forEach var="reservation" items="${reservationList}">
    <tr>
    <td>${reservation.reseq}</td>
    <td>${reservation.userid}</td>
    <td>${reservation.title}</td>
    <td>${reservation.people}</td>
    <td>${reservation.classday} ${reservation.classtime}</td>
    <td>
    <c:choose>
        <c:when test="${reservation.payment == 'Y'}">정산 완료</c:when>
        <c:otherwise>
            정산 대기중
            <button onclick="processPayment(${reservation.reseq})">정산 하기</button>
        </c:otherwise>
    </c:choose>
    </td>
     <td>${reservation.endedclass == 'Y' ? '클래스 마감' : '진행 중'}</td>
        <td><button onclick="deleteReservation(${reservation.reseq})">삭제</button></td>
        </tr>
        </c:forEach>
        </tbody>
        </table>

        <!-- 페이징 영역 -->
<div class="pagination">
    <c:if test="${paging.prev}">
        <a href="#" onclick="searchReservations(${paging.beginPage - 1}); return false;">◀</a>
    </c:if>
    <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
        <a href="#" onclick="searchReservations(${index}); return false;"
           class="${index == paging.page ? 'active' : ''}">${index}</a>
    </c:forEach>
    <c:if test="${paging.next}">
        <a href="#" onclick="searchReservations(${paging.endPage + 1}); return false;">▶</a>
    </c:if>
</div>




