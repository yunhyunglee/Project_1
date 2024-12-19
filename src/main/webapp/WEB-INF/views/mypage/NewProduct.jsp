
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#imageAddBtn').click(function(){
            var formselect = $('#fileupForm')[0];	//	지목된 폼을 변수에 저장
            var formData = new FormData(formselect);
            console.log(formData);
            $.ajax({
                url:"/fileup",
                type:"POST",
                // enctype:"multipart/form-data",
                data : formData,
                timeout:10000,
                contentType:false,
                processData:false,

                success:function(data){
                    $('#filename').html("<div>" + data.image + "</div>");
                    $("#filename").append("<img src='product_images/" + data.savefilename + "' height='150'/>");
                    $('#image').val(data.image);
                    $('#savefilename').val(data.savefilename);
                },
                error:function(){ alert("실패")},
            });
        });
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        var dropdownButton = document.getElementById('dropdownButton');
        var checkboxesContainer = document.getElementById('checkboxContainer');

        dropdownButton.addEventListener('click', function() {
            checkboxesContainer.style.display = checkboxesContainer.style.display === 'block' ? 'none' : 'block';
        });

        window.addEventListener('click', function(event) {
            if (!dropdownButton.contains(event.target) && !checkboxesContainer.contains(event.target)) {
                checkboxesContainer.style.display = 'none';
            }
        });

        const submitButton = document.getElementById('submitButton');
        submitButton.addEventListener('click', () => {
            if(!($('input[name="selectedTime"]:checked').length > 0)){
                alert("시간대를 하나이상 선택해야 합니다.");
            }else {
                document.insertNewProduct.submit();
            }
        });
    });

</script>
<div class="mypage-myclass-container">
    <!-- 사이드바 포함 -->
    <jsp:include page="../sidebar.jsp" />

    <!-- 메인 콘텐츠 -->
    <div class="mypage-myclass-content">
        <h2 class="myclass-title">새 클래스 등록</h2>
        <form method="POST" action="/insertNewProduct" name="insertNewProduct" enctype="multipart/form-data">
            <!-- 강사 -->
            <div class="myclass-field">
                <label>강사 정보</label>
                <input type="text" name="id" value="${dto.name}" class="myclass-input" readonly>
                <input type="text" name="id" value="${dto.id}" class="myclass-input" readonly>
            </div>
            <!-- 클래스 제목 -->
            <div class="myclass-field">
                <label>클래스 제목</label>
                <input type="text" name="title" class="myclass-input" placeholder="클래스 제목을 입력하세요" required>
            </div>

            <!-- 가격 -->
            <div class="myclass-field">
                <label>가격</label>
                <input type="number" name="price" class="myclass-input" placeholder="가격을 입력하세요" required>
            </div>

            <!-- 카테고리 -->
            <div class="myclass-field">
                <label>카테고리</label>
                <input type="text" name="category" class="myclass-input" placeholder="카테고리를 입력하세요" required>
            </div>
            <div class="myclass-field">
                <div class="myclass-dropdown-container">
                    <input id="dropdownButton" type="button" value="시간을 선택해주세요." class="myclass-input"/>
                    <div id="checkboxContainer" class="myclass-dropdown-checkboxes">
                        <%
                            // stimes가 null이거나 존재하지 않으면 빈 리스트로 초기화
                            java.util.List<String> stimes = (java.util.List<String>) request.getAttribute("stimes");
                            if (stimes == null) {
                                stimes = new java.util.ArrayList<>();
                            }

                            // 시간 선택 부분 반복 생성
                            for (int i = 0; i < 24; i++) {
                                String hour = String.format("%02d:00", i);
                        %>
                        <label>
                            <input type="checkbox" class="time-checkbox" name="selectedTime" value="<%= hour %>"> <%= hour %>
                        </label>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div id="selectedTimes" class="myclass-selected-time"></div> <!-- 선택된 시간 표시 영역 -->
            </div>


            <!-- 우편번호 찾기 -->
            <div class="myclass-field">
                <label>우편번호</label>
                <input type="text" id="sample6_postcode" name="zip_num" class="myclass-input" placeholder="우편번호" readonly>
                <button type="button" onclick="sample6_execDaumPostcode()" class="myclass-action-btn">우편번호 찾기</button>
            </div>

            <!-- 주소 -->
            <div class="myclass-field">
                <label>주소</label>
                <input type="text" id="sample6_address" name="address1" class="myclass-input" placeholder="주소" readonly>
            </div>

            <!-- 상세 주소 -->
            <div class="myclass-field">
                <label>상세 주소</label>
                <input type="text" id="sample6_detailAddress" name="address2" class="myclass-input" placeholder="상세 주소">
            </div>

            <!-- 내용 -->
            <div class="myclass-field">
                <label>내용</label>
                <input type="text" name="content" class="myclass-input" placeholder="내용을 입력하세요" required>
            </div>

            <!-- 정원 -->
            <div class="myclass-field">
                <label>정원</label>
                <input type="text" name="max_people" class="myclass-input" placeholder="최대 정원을 입력하세요" required>
            </div>

            <!-- 이미지 업로드 -->
            <div class="myclass-file-upload">
                <form id="fileupForm" method="post" enctype="multipart/form-data">
                <input type="file" name="fileimage" class="myclass-file-input"/>
                <input type="button" id="imageAddBtn" value="추가" class="myclass-action-btn">
                </form>
            </div>


            <!-- 버튼 영역 -->
            <div class="myclass-actions">
                <input type="hidden" name="image" id="image" value="${pvo.image}">
                <input type="hidden" name="savefilename" id="savefilename" value="${pvo.savefilename}">
<%--                <button type="submit" id="submitButton" class="myclass-action-btn">새 클래스 등록</button>--%>
<input type="button" value="클래스 정보 저장" id="submitButton" class="myclass-action-btn">
<%--                <button type="button" onclick="history.back()" class="myclass-cancel-btn">되돌아가기</button>--%>
                <input type="button" onclick="history.back()" value="돌아가기" class="myclass-action-btn">
            </div>
        </form>
    </div>
</div>

<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                let addr = '';
                let extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    extraAddr = extraAddr ? ` (${extraAddr})` : '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById('sample6_address').value = addr;
                document.getElementById('sample6_detailAddress').focus();
            }
        }).open();
    }
</script>
<%@ include file="../footer.jsp" %>
