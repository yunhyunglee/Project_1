<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<h2>예약 관리</h2>

<input type="text" id="searchInput" placeholder="검색하려는 예약정보를 입력해주세요."
       onkeyup="searchReservations()" style="width:30%;"/>


<!-- 필터 버튼 -->
<div class="tabs">
    <div class="tab" onclick="filterReservation('all')">전체</div>
    <div class="tab" onclick="filterReservation('in_progress')">진행 중</div>
    <div class="tab" onclick="filterReservation('completed')">완료</div>
    <div class="tab" onclick="filterReservation('cancelled')">취소</div>
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
    <tbody>
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
                    <c:when test="${reservation.payment == 'N'}">정산 대기중</c:when>
                </c:choose>
            <td>
                <c:choose>
                    <c:when test="${reservation.endedclass == 'Y'}">클래스 마감</c:when>
                    <c:when test="${reservation.endedclass == 'N'}">진행 중</c:when>
                </c:choose>
            </td>
            <td>
                <button onclick="deleteReservation(${reservation.reseq})">삭제</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


