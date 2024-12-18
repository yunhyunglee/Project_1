<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="product-detail-page">
    <!-- 상단 섹션 -->
    <section class="top-section">
        <div class="product-image-slider">
            <img src="/product_images/${productVo.savefilename}" alt="${productVo.title}" />
        </div>
        <div class="product-summary">
            <div class="text-info">
                <h1 class="product-title">${productVo.title}</h1>
                <p class="product-address">${productVo.address1}</p>
                <p class="price">${productVo.price}원</p>
            </div>
            <div class="productDetail-button-group">
                <button class="wishlist-btn" onclick="toggleHeart(this, ${productVo.cseq}, '${loginUser.id}')">
                    <c:choose>
                        <c:when test="${zzim eq true}">
                            <i class="fi fi-ss-heart"></i>
                        </c:when>
                        <c:otherwise>
                            <i class="fi fi-rs-heart"></i>
                        </c:otherwise>
                    </c:choose>
                </button>
                <button class="enroll-btn">참여하기</button>
            </div>
        </div>
    </section>
<div class="popup-overlay option-popup" id="productOptionsPopup" style="display: none;">
    <div class="popup-content option-popup-content">

        <h3>상품 옵션 선택</h3>
        <form id="productOptionsForm" action="insertReservation" method="post">
            <input type="hidden" name="payment" id="payment" value="" />
            <input type="hidden" name="cseq" value="${productVo.cseq}" />
            <div class="calendar-container">
                <style>
                    .calendar-container {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                    }

                    .calendar {
                        width: 320px;
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        overflow: hidden;
                        background: #fff;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    }
                    .calendar-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        background: #19A7CE;
                        color: #fff;
                        padding: 10px 15px;
                    }
                    .calendar-header button {
                        background: none;
                        border: none;
                        color: #fff;
                        font-size: 18px;
                        cursor: pointer;
                    }
                    .calendar-header button:hover {
                        opacity: 0.8;
                    }
                    .calendar-header span {
                        font-size: 16px;
                        font-weight: bold;
                    }
                    .calendar-days {
                        display: grid;
                        grid-template-columns: repeat(7, 1fr);
                        background: #f9f9f9;
                        padding: 10px 0;
                    }
                    .calendar-days div {
                        text-align: center;
                        font-weight: bold;
                    }
                    .calendar-grid {
                        display: grid;
                        grid-template-columns: repeat(7, 1fr);
                        padding: 10px;
                    }
                    .calendar-grid div {
                        text-align: center;
                        padding: 10px;
                        margin: 2px;
                        border-radius: 5px;
                    }
                    .calendar-grid div.today {
                        background: #19A7CE;
                        color: #fff;
                    }
                    .calendar-grid div:hover {
                        background: #f0f0f0;
                        cursor: pointer;
                    }
                    .calendar-grid div.before{
                        background: gray;
                        color: #fff;
                    }
                    .calendar-grid div.selected{
                        background: #FF7F50;
                        color: #fff;
                    }
                </style>
                <div class="calendar">
                    <div class="calendar-header">
                        <button id="prev-month">&#9664;</button>
                        <span id="month-year"></span>
                        <button id="next-month">&#9654;</button>
                    </div>
                    <div class="calendar-days">
                        <div>Sun</div>
                        <div>Mon</div>
                        <div>Tue</div>
                        <div>Wed</div>
                        <div>Thu</div>
                        <div>Fri</div>
                        <div>Sat</div>
                    </div>
                    <div class="calendar-grid" id="calendar-grid"></div>

                    <%--            <div id="selectedday"></div>--%>
                    <input type="hidden" id="selectedday" name="selectedday">
                </div>

                <script>
                    const calendarGrid = document.getElementById('calendar-grid');
                    const monthYear = document.getElementById('month-year');
                    const prevMonthBtn = document.getElementById('prev-month');
                    const nextMonthBtn = document.getElementById('next-month');

                    const today = new Date();
                    let currentMonth = today.getMonth();
                    let currentYear = today.getFullYear();

                    function renderCalendar(month, year) {
                        const monthNames = [
                            'January', 'February', 'March', 'April', 'May', 'June',
                            'July', 'August', 'September', 'October', 'November', 'December'
                        ];

                        monthYear.textContent = monthNames[month] + ' ' + year;
                        calendarGrid.innerHTML = '';



                        const firstDay = new Date(year, month, 1).getDay();
                        const daysInMonth = new Date(year, month + 1, 0).getDate();

                        for (let i = 0; i < firstDay; i++) {
                            const emptyCell = document.createElement('div');
                            calendarGrid.appendChild(emptyCell);
                        }

                        for (let day = 1; day <= daysInMonth; day++) {
                            const dayCell = document.createElement('div');
                            dayCell.classList.add('daycell');
                            dayCell.textContent = day;
                            if (
                                day === today.getDate() &&
                                month === today.getMonth() &&
                                year === today.getFullYear()
                            ) {
                                dayCell.classList.add('today');
                            }else if(new Date(year, month, day) < today){
                                dayCell.classList.add('before');
                                dayCell.classList.remove('daycell');
                            }

                            calendarGrid.appendChild(dayCell);
                        }
                    }

                    prevMonthBtn.addEventListener('click', () => {
                        currentMonth--;
                        if (currentMonth < 0) {
                            currentMonth = 11;
                            currentYear--;
                        }
                        renderCalendar(currentMonth, currentYear);
                    });

                    nextMonthBtn.addEventListener('click', () => {
                        currentMonth++;
                        if (currentMonth > 11) {
                            currentMonth = 0;
                            currentYear++;
                        }
                        renderCalendar(currentMonth, currentYear);
                    });

                    document.addEventListener('DOMContentLoaded', () => {

                        renderCalendar(currentMonth, currentYear);
                        $('.calendar-grid').on('click','.daycell',function(){
                            $('.daycell').removeClass('selected');
                            $(this).addClass('selected');
                            $('#selectedday').val(currentYear+"-"+(currentMonth+1)+"-"+$(this).text());
                            $('#option2').val('');
                            $('#able-people').text('');
                        });
                        $('.today').click();
                    });
                </script>
            </div>

            <label for="option2">시간</label>
            <select id="option2" name="option2" >
                <option value="">옵션을 선택하세요</option>
                <c:forEach items="${classTime}" var="time" varStatus="status">
                        <c:choose>
                            <c:when test="${dto.classtime ==status.count}">
                                <option value="${time}" selected>${time}</option>
                            </c:when>
                            <c:otherwise>
                                <option name="time" value="${time}">${time}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

            </select>
                <div id="able-people" data-max="${productVo.max_people}"></div>
            <label for="option3">신청인원</label>
            <input type="number" name="people" id="option3" value="1" max="${productVo.max_people}" min="1" required>
            <button type="button" class="submit-btn" data-id="${loginUser.id}">확인</button>
        </form>

        <button class="close-btn option-close-btn">닫기</button>
    </div>
</div>
    <!-- 클래스 소개 및 주요 정보 -->
    <section class="product-info-section">
        <div class="item-intro">
            <h2>클래스 소개</h2>
            <p>${productVo.content}</p>
        </div>
        <div class="section-divider"></div>
        <div class="item-location">
            <h3>진행 장소</h3>
                <div id="map-container">
                    <div id="map" style="width:100%;height:350px;"></div>

                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2686583c7f6360158217652f3a4a0355&libraries=services"></script>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                        // 지도를 생성합니다
                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder = new kakao.maps.services.Geocoder();

                        // 주소로 좌표를 검색합니다
                        geocoder.addressSearch('${productVo.address1} ${productVo.address3}', function(result, status) {

                            // 정상적으로 검색이 완료됐으면
                            if (status === kakao.maps.services.Status.OK) {

                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                // 결과값으로 받은 위치를 마커로 표시합니다
                                var marker = new kakao.maps.Marker({
                                    map: map,
                                    position: coords
                                });

                                // 인포윈도우로 장소에 대한 설명을 표시합니다
                                var infowindow = new kakao.maps.InfoWindow({
                                    content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지</div>'
                                });
                                infowindow.open(map, marker);

                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                            }
                        });

                    </script>
                </div>
            </div>
    </section>
    <section class="reviews">
        <h2>후기 (${reviews.size()})</h2>
        <c:if test="${not empty reviews}">
            <ul class="review-list">
                <c:forEach var="review" items="${reviews}">
                    <li class="review-item">
                        <div class="review-header">
                            <span class="reviewer-name">
                                <c:choose>
                                    <c:when test="${not empty review.id}">${review.id}</c:when>
                                    <c:otherwise>익명</c:otherwise>
                                </c:choose>
                            </span>
                            <span class="review-rating">
                                <c:forEach var="star" begin="1" end="5" >
                                    <c:choose>
                                        <c:when test="${star <= review.rating}">
                                            <i class="fi fi-ts-star"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fi fi-ts-star"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </span>
                            <span class="review-date">
                                <fmt:formatDate value="${review.indate}" pattern="yyyy-MM-dd HH:mm" />
                            </span>
                        </div>
                        <div>
                            ${review.content}
                            <c:if test="${not empty review.savefilename}">
                                <img src=product_images/${review.savefilename}>
                            </c:if>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty reviews}">
            <p>아직 등록된 후기가 없습니다.</p>
        </c:if>
        <c:if test="${not empty reviewopen}">
        <div class="questions">
           <form id="contactForm" action="review">
               <input type="hidden" id="savefilename" name="savefilename">
               <input type="hidden" name="cseq" value="${productVo.cseq}">
               <select name="rating" id="rating">
                    <option value="1">&#11088;</option>
                    <option value="2">&#11088;&#11088;</option>
                    <option value="3">&#11088;&#11088;&#11088;</option>
                    <option value="4">&#11088;&#11088;&#11088;&#11088;</option>
                    <option value="5">&#11088;&#11088;&#11088;&#11088;&#11088;</option>
               </select>
               <textarea name="review" placeholder="후기 내용을 입력하세요" required></textarea>
               <button type="submit" class="submit-btn">후기등록</button>
            </form>
        </div>
        <div name="reviewImage">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jqury.min.js"></script>
            <script type="text/javascript">
                $(function(){
                    $('#imageAddBtn').click(function(){
                        var formselect = $('#fileupForm')[0];	//	지목된 폼을 변수에 저장
                        var formData = new FormData(formselect);
                        $.ajax({
                            url:"<%=request.getContextPath()%>/fileup",
                            type:"POST",
                            enctype:"multipart/form-data",
                            data : formData,
                            timeout:10000,
                            contentType:false,
                            processData:false,

                            success:function(data){
                                $("#filename").append("<img src='product_images/" + data.savefilename + "' height='150'/>");
                                $('#image').val(data.image);
                                $('#savefilename').val(data.savefilename);
                            },
                            error:function(){ alert("실패")},
                        });
                    });
                });
            </script>
            <div style="position:relative; border:1px solid black; width:500px; margin:0 auto;">
                <div id="filename"></div>
                <form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
                    <input type="file" name="fileimage" />
                    <input type="button" id="imageAddBtn" value="추가">
                </form>
            </div>
        </div>
        </c:if>
    </section>

    <!-- 문의하기 -->
    <section class="reviews-and-questions">
        <div class="questions">
            <h2>문의하기</h2>
            <form id="contactForm">
                <textarea name="question" placeholder="문의 내용을 입력하세요" required></textarea>
                <button type="submit" class="submit-btn">문의하기</button>
            </form>
        </div>
    </section>

    <!-- 환불 정책 -->
    <section class="return-policy-section">
        <h2>환불 정책</h2>
        <div class="policy-summary">
            환불 및 변경 정책을 확인하세요.
        </div>
        <button class="toggle-btn" onclick="togglePolicy()">더보기</button>
        <div class="policy-content" style="display: none;">
            <p>
                1. 결제 후 14일 이내 취소 시 : 전액 환불<br>
                (단, 결제 후 14일 이내라도 호스트와 프립 진행일 예약 확정 후 환불 불가)<br>
                2. 결제 후 14일 이후 취소 시 : 환불 불가<br>
                ※ 상품의 유효기간 만료 시 연장은 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
                ※ 배송상품의 경우 배송 준비 전 전액 환불 가능, 배송 준비 후 환불 불가 합니다.<br>
                ※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
            </p>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>
