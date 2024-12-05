<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="com.himedia.project_1.dto.BusinessmanVo" %>--%>
<%--<%--%>
<%--    BusinessmanVo business = (BusinessmanVo) request.getAttribute("business");--%>
<%--%>--%>
<%@ include file="../header.jsp" %>

<section class="class-detail">
    <div class="image-section">
        <img src="https://placeholder.co/400x300" alt="클래스 이미지">
    </div>
    <div class="info-section">
        <h2>title</h2>
        <p class="price"><h3>50,000원</h3></p>
        <p class="description">
            content입니다.
        </p>
        <div class="button-group">
            <button class="enroll-btn">신청하기</button>
            <button class="cart-btn">찜하기</button>
        </div>
        <div class="businessman_info">

        </div>
        <%--        <div class="business-profile">--%>
        <%--            <div class="profile-info">--%>
        <%--                <p><strong>사업자 ID:</strong> <%= business.getId() %></p>--%>
        <%--                <p><strong>이름:</strong> <%= business.getName() %></p>--%>
        <%--                <p><strong>전화:</strong> <%= business.getPhone() %></p>--%>
        <%--                <p><strong>이메일:</strong> <%= business.getEmail() %></p>--%>
        <%--                <p><strong>사업자 등록번호:</strong> <%= business.getBusinessnum() %></p>--%>
        <%--                <p><strong>가입일:</strong> <%= business.getIndate() %></p>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</section>
<div class="lower-section">
    <div class="details">
        <h3>클래스 소개</h3>
        <p>이 클래스는 10년 경력의 전문가인 김철수 강사가 진행합니다.</p>
        <h3>준비물</h3>
        <ul>
            <li>편안한 복장</li>
            <li>필기도구</li>
        </ul>
        <h3>위치</h3>
        <p>서울특별시 강남구 테헤란로 123</p>
        <div class="map">
            <!-- * 카카오맵 - 지도퍼가기 -->
            <!-- 1. 지도 노드 -->
            <div id="daumRoughmapContainer1733284843945" class="root_daum_roughmap root_daum_roughmap_landing"></div>

            <!--
                2. 설치 스크립트
                * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
            -->
            <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

            <!-- 3. 실행 스크립트 -->
            <script charset="UTF-8">
                new daum.roughmap.Lander({
                    "timestamp" : "1733284843945",
                    "key" : "2mexn",
                    "mapWidth" : "550",
                    "mapHeight" : "300"
                }).render();
            </script>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>