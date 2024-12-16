<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<section class="product-detail">
    <!-- 상품 이미지 섹션 -->
    <div class="product-image">
<%--        <img src="/images/${product.image}" alt="${product.title}" />--%>

<%--        <img src="http://placehold.co/300x300">--%>
<%--        <img src="/static/images/${productVo.image}" alt="${productVo.title}" />--%>
        <img src="/images/product/${empty product.image ? 'placeholder.jpg' : product.image}" alt="${product.title}" />
    </div>

    <!-- 상품 정보 섹션 -->
    <div class="product-info">
        <h3>${productVo.title}</h3>
        <p>${productVo.address1}, ${productVo.address2}, ${productVo.address3}</p>
        <p class="price">${productVo.price}원</p>
<%--        <p class="description">${product.description}</p>--%>
        <p class="description">${productVo.content}</p>
        <p><strong>최대 수용인원 : </strong> ${productVo.max_people}</p>
        <div class="button-group">

            <button class="enroll-btn" data-cseq="${productVo.cseq}">신청하기</button>
            <!-- 찜하기 버튼 -->
            <button class="wishlist-btn" onclick="toggleHeart(this,${productVo.cseq},'${loginUser.id}')">
            <c:choose>
                <c:when test="${zzim eq true}">
                 <i class="fi fi-ss-heart"></i>

                </c:when>
                <c:otherwise>
                 <i class="fi fi-rs-heart"></i>
                         <!-- 빈 하트 아이콘 -->

                </c:otherwise>
            </c:choose>

            </button>
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
                        background: #007bff;
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
                        background: #007bff;
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
                        background: #FFC107;
                        color: #fff;
                    }
                </style>
                <div class="calendar">
                    <div class="calendar-header">
                        <button type="button" id="prev-month">&#9664;</button>
                        <span id="month-year"></span>
                        <button type="button" id="next-month">&#9654;</button>
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
                                <option value="${time}" >${time}</option>
                </c:forEach>

            </select>
                <div id="able-people" data-max="${productVo.max_people}"></div>
            <label for="option3">신청인원</label>
            <input type="number" name="people" id="option3" value="1" min="1" required>

            <button type="button" class="submit-btn" data-id="${loginUser.id}">확인</button>
        </form>

        <button class="close-btn option-close-btn">닫기</button>
    </div>
</div>


<!-- 상품 상세설명 섹션 -->
<section class="product-description">
    <h3>상품 상세 설명</h3>
    <button class="toggle-description">
        <i class="fi fi-rr-angle-down"></i>
    </button>
    <div class="description-content">
        <p>${product.detailedDescription}</p>
    </div>

    <!-- 지도 섹션 -->
    <section class="location">
        <h3>위치</h3>
        <p>${product.location}</p>
        <div class="map">
            <div id="map-container"></div>
        </div>
    </section>

</section>

<!-- 후기 섹션 -->
<section class="reviews">
    <h3>후기</h3>
    <button class="toggle-reviews">
        <i class="fi fi-rr-angle-down"></i>
    </button>
    <div class="review-list">
        <ul>
            <c:forEach var="review" items="${reviews}">
                <li>${review.id}: ${review.content}</li>
            </c:forEach>
        </ul>
    </div>
</section>

<!-- 환불 정책 섹션 -->
<section class="return-policy">
    <h3 class="toggle-title">
        <span>변경 및 취소 정책</span>
        <i class="fi fi-rr-angle-down"></i>
    </h3>
    <div class="policy-content">
        <p> 1. 결제 후 14일 이내 취소 시 : 전액 환불<br>
            (단, 결제 후 14일 이내라도 호스트와 프립 진행일 예약 확정 후 환불 불가)<br>
            2. 결제 후 14일 이후 취소 시 : 환불 불가<br>
            ※ 상품의 유효기간 만료 시 연장은 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
            ※ 배송상품의 경우 배송 준비 전 전액 환불 가능, 배송 준비 후 환불 불가 합니다.<br>
            ※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가하며, 기간 내 호스트와 예약 확정 되지 않은 클래스는 환불 됩니다.<br>
            [환불 신청 방법]<br>
            1. 해당 클래스를 결제한 계정으로 로그인<br>
            2. 마이페이지 - 예약내역 or 결제내역</p><br>
    </div>
</section>

<!-- 문의하기 팝업 버튼 -->
<section class="contact-section">
    <button class="contact-btn" onclick="toggleContactForm()">문의하기</button>
</section>

<!-- 문의하기 팝업 폼 -->
<div class="popup-overlay contact-popup" id="contactFormPopup">
    <div class="popup-content contact-popup-content">
        <h3>문의하기</h3>
        <form id="contactForm">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" required>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required>

            <label for="message">내용</label>
            <textarea id="message" name="message" required></textarea>

            <button type="submit" class="submit-btn">전송하기</button>
        </form>
        <button class="close-btn contact-close-btn" onclick="closeContactForm()"><i class="fi fi-rr-cross"></i></button>
    </div>
</div>
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
        geocoder.addressSearch('${productVo.address1} ${productVo.address2} ${productVo.address3}', function(result, status) {

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


<%@ include file="../footer.jsp" %>





<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="../header.jsp" %>--%>

<%--<section class="product-detail">--%>
<%--    <!-- 상단: 상품 이미지와 기본 정보 -->--%>
<%--    <div class="product-header">--%>
<%--        <div class="product-image">--%>
<%--            <img src="/images/product/${empty product.image ? 'placeholder.jpg' : product.image}" alt="${product.title}" />--%>
<%--        </div>--%>
<%--        <div class="product-info">--%>
<%--            <h3>${productVo.title}</h3>--%>
<%--            <p>${productVo.address1}, ${productVo.address2}, ${productVo.address3}</p>--%>
<%--            <p class="product-detail-price">${productVo.price}원</p>--%>
<%--            <p class="product-detail-description">${productVo.content}</p>--%>
<%--            <p><strong>최대 수용인원:</strong> ${productVo.max_people}</p>--%>
<%--            <div class="product-detail-button-group">--%>
<%--                <button class="product-detail-enroll-btn" data-cseq="${productVo.cseq}">신청하기</button>--%>
<%--                <button class="product-detail-wishlist-btn" onclick="toggleHeart(this, ${productVo.cseq}, '${loginUser.id}')">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${zzim eq false}">--%>
<%--                            <i class="fi fi-rs-heart"></i>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <i class="fi fi-ss-heart"></i>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<!-- 아래 상세 구성 -->--%>
<%--<section class="product-content">--%>
<%--    <!-- 상품 상세 설명 -->--%>
<%--    <div class="product-description">--%>
<%--        <h3>상품 상세 설명</h3>--%>
<%--        <p>${product.detailedDescription}</p>--%>
<%--    </div>--%>

<%--&lt;%&ndash;    <!-- 옵션 선택 -->&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="product-options">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <h3>옵션 선택</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <form id="product-detail-options-form">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label for="product-detail-option1">옵션 1</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <select id="product-detail-option1" name="option1" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="">옵션을 선택하세요</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="optionA">옵션 A</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="optionB">옵션 B</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </select>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <label for="product-detail-option2">옵션 2</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <select id="product-detail-option2" name="option2">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="">옵션을 선택하세요</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="optionC">옵션 C</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="optionD">옵션 D</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </select>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <button type="submit" class="product-detail-submit-btn">확인</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </form>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>



<%--    <!-- 후기 -->--%>
<%--    <div class="product-reviews">--%>
<%--        <h3>후기</h3>--%>
<%--        <ul>--%>
<%--            <c:forEach var="review" items="${reviews}">--%>
<%--                <li><strong>${review.id}</strong>: ${review.content}</li>--%>
<%--            </c:forEach>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--    <!-- 환불 정책 -->--%>
<%--    <div class="product-return-policy">--%>
<%--        <h3>변경 및 취소 정책</h3>--%>
<%--        <p>--%>
<%--            1. 결제 후 14일 이내 취소 시: 전액 환불<br>--%>
<%--            (단, 결제 후 14일 이내라도 호스트와 예약 확정 후 환불 불가)<br>--%>
<%--            2. 결제 후 14일 이후 취소 시: 환불 불가<br>--%>
<%--            ※ 상품 유효기간 만료 시 연장은 불가하며, 미확정 클래스는 환불됩니다.<br>--%>
<%--            [환불 신청 방법]<br>--%>
<%--            1. 해당 클래스를 결제한 계정으로 로그인<br>--%>
<%--            2. 마이페이지 > 예약내역 or 결제내역<br>--%>
<%--        </p>--%>
<%--    </div>--%>

<%--    <!-- 위치 정보 -->--%>
<%--    <div class="product-location">--%>
<%--        <h3>위치</h3>--%>
<%--        <p>${product.location}</p>--%>
<%--        <div id="product-detail-map-container"></div>--%>
<%--    </div>--%>

<%--    <!-- 문의하기 -->--%>
<%--    <div class="product-contact-section">--%>
<%--        <h3>문의하기</h3>--%>
<%--        <button class="product-detail-contact-btn" onclick="toggleContactForm()">문의하기</button>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<div class="popup-overlay option-popup" id="productOptionsPopup" style="display: none;">--%>
<%--    <div class="popup-content option-popup-content">--%>
<%--        <h3>상품 옵션 선택</h3>--%>
<%--        <form id="productOptionsForm">--%>
<%--            <label for="option1">옵션 1</label>--%>
<%--            <select id="option1" name="option1" required>--%>
<%--                <option value="">옵션을 선택하세요</option>--%>
<%--                <option value="optionA">옵션 A</option>--%>
<%--                <option value="optionB">옵션 B</option>--%>
<%--            </select>--%>

<%--            <label for="option2">옵션 2</label>--%>
<%--            <select id="option2" name="option2">--%>
<%--                <option value="">옵션을 선택하세요</option>--%>
<%--                <option value="optionC">옵션 C</option>--%>
<%--                <option value="optionD">옵션 D</option>--%>
<%--            </select>--%>

<%--            <button type="submit" class="submit-btn">확인</button>--%>
<%--        </form>--%>
<%--        <button class="close-btn option-close-btn" onclick="closeProductOptionsPopup()">닫기</button>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<!-- 문의하기 팝업 -->--%>
<%--<div class="popup-overlay product-contact-popup" id="productDetailContactPopup" style="display: none;">--%>
<%--    <div class="popup-content product-contact-popup-content">--%>
<%--        <h3>문의하기</h3>--%>
<%--        <form id="productDetailContactForm">--%>
<%--            <label for="product-detail-name">이름</label>--%>
<%--            <input type="text" id="product-detail-name" name="name" required>--%>

<%--            <label for="product-detail-email">이메일</label>--%>
<%--            <input type="email" id="product-detail-email" name="email" required>--%>

<%--            <label for="product-detail-message">내용</label>--%>
<%--            <textarea id="product-detail-message" name="message" required></textarea>--%>

<%--            <button type="submit" class="product-detail-submit-btn">전송하기</button>--%>
<%--        </form>--%>
<%--        <button class="product-detail-close-btn" onclick="closeContactForm()">--%>
<%--            <i class="fi fi-rr-cross"></i> 닫기--%>
<%--        </button>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<%@ include file="../footer.jsp" %>--%>
