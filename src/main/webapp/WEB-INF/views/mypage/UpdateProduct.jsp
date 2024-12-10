
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
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
                    $('#filename').html("<div>" + data.image + "</div>");
                    $("#filename").append("<img src='product_images/" + data.savefilename + "height='150'/>");
                    $('#image').val(data.image);
                    $('#savefilename').val(data.savefilename);
                },
                error:function(){ alert("실패")},
            });
        });
    });
</script>
<style>
    .dropdown-checkboxes {
        display: none;
        border: 1px solid #ccc;
        padding: 10px;
        background-color: #fff;
        position: absolute;
        z-index: 1000;
    }
    .dropdown-container {
        position: relative;
        display: inline-block;
    }

</style>
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

        document.getElementById('deleteButton').addEventListener('click', () => {
            document.insertNewProduct.action='deleteProduct';
            document.insertNewProduct.submit();
        });
    });

</script>

<form method="POST" action="/UpdateProduct" name="insertNewProduct" >
    <input type="hidden" name="cseq" value="${pvo.cseq}" />
    <input type="hidden" name="image" id="image" value="${pvo.image}" ><!-- 전송될 파일이름 -->
    <input type="hidden" name="savefilename" id="savefilename" value="${pvo.savefilename}">

    <div>
        <label>클래스 제목</label>    <input type="text" name="title"  value="${pvo.title}">
    </div>
    <div>
        <label>카테고리</label>    <input type="text" name="category"  value="${pvo.category}">
    </div>
    <div class="field">
        <label>클래스 장소</label>
        <div>
            <label>우편 번호</label>
            <input type="text"  id="sample6_postcode" name="zip_num" value="${pvo.zip_num}"   readonly>
            <input type="button" value="우편번호 찾기"  onclick="sample6_execDaumPostcode()">
        </div>
    </div>
    <div class="field">
        <label>주소</label><input type="text"   id="sample6_address"   name="address1"  value="${pvo.address1}"  readonly />
    </div>
    <div class="field">
        <label>상세 주소</label><input type="text"    id="sample6_detailAddress"   name="address2" value="${pvo.address2}" />
    </div>
    <div class="field">
        <label>도로명 주소</label><input type="text" id="sample6_extraAddress" name="address3" value="${pvo.address3}" />
    </div>



    <!-- 다음 카카오 도로명 주소 검색을 위한 자바스크립트 코드들 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode( {
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_extraAddress").focus();
                }
            }).open();
        }
    </script><br>

    <div>
        <label>가격</label>    <input type="number" name="price" value="${pvo.price}">
    </div>
    <div>
        <div class="dropdown-container">
<%
    java.util.List<String>stimes=(java.util.List<String>)request.getAttribute("stimes");
%>
            <input id="dropdownButton" type="button" value="Choose times"/>
            <div id="checkboxContainer" class="dropdown-checkboxes">
                <label><input type="checkbox" name="selectedTime" value="00:00" <% if(stimes.contains("00:00:00")){ %> checked <% } %>> 00:00</label><br>
                <label><input type="checkbox" name="selectedTime" value="01:00" <% if(stimes.contains("01:00:00")){ %> checked <% } %>> 01:00</label><br>
                <label><input type="checkbox" name="selectedTime" value="02:00" <% if(stimes.contains("02:00:00")){ %> checked <% } %>> 02:00</label><br>
                <label><input type="checkbox" name="selectedTime" value="03:00" <% if(stimes.contains("03:00:00")){ %> checked <% } %>> 03:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="04:00" <% if(stimes.contains("04:00:00")){ %> checked <% } %>> 04:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="05:00" <% if(stimes.contains("05:00:00")){ %> checked <% } %>> 05:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="06:00" <% if(stimes.contains("06:00:00")){ %> checked <% } %>> 06:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="07:00" <% if(stimes.contains("07:00:00")){ %> checked <% } %>> 07:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="08:00" <% if(stimes.contains("08:00:00")){ %> checked <% } %>> 08:00</label><br>
                <label><input type="checkbox" name="selectedTime" value="09:00" <% if(stimes.contains("09:00:00")){ %> checked <% } %>> 09:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="10:00" <% if(stimes.contains("10:00:00")){ %> checked <% } %>> 10:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="11:00" <% if(stimes.contains("11:00:00")){ %> checked <% } %>> 11:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="12:00" <% if(stimes.contains("12:00:00")){ %> checked <% } %>> 12:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="13:00" <% if(stimes.contains("13:00:00")){ %> checked <% } %>> 13:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="14:00" <% if(stimes.contains("14:00:00")){ %> checked <% } %>> 14:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="15:00" <% if(stimes.contains("15:00:00")){ %> checked <% } %>> 15:00</label><br>
                <label><input type="checkbox" name="selectedTime" value="16:00" <% if(stimes.contains("16:00:00")){ %> checked <% } %>> 16:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="17:00" <% if(stimes.contains("17:00:00")){ %> checked <% } %>> 17:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="18:00" <% if(stimes.contains("18:00:00")){ %> checked <% } %>> 18:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="19:00" <% if(stimes.contains("19:00:00")){ %> checked <% } %>> 19:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="20:00" <% if(stimes.contains("20:00:00")){ %> checked <% } %>> 20:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="21:00" <% if(stimes.contains("21:00:00")){ %> checked <% } %>> 21:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="22:00" <% if(stimes.contains("22:00:00")){ %> checked <% } %>> 22:00</label><br>
                <label><input type="checkbox" name="selectedTime"  value="23:00" <% if(stimes.contains("23:00:00")){ %> checked <% } %>> 23:00</label><br>
            </div>
        </div>
    </div>


    <div>
        <label>강사</label>    <input type="text" name="id" value="${dto.id}" readonly>
    </div>
    <div>
        <label>내용</label>    <input type="text" name="content" value="${pvo.content}">
    </div>
    <div>
        <label>정원</label>   <input type="text" name="max_people" value="${pvo.max_people}">
    </div>
    <div>${message}</div>

    <div>
        <input type="button" value="클래스 정보수정" id="submitButton">
        <input type="button" value="클래스 폐강" id="deleteButton">
        <input type="button" onclick="location.href='/'" value="되돌아가기">
    </div>

</form>
<div style="position:relative; border:1px solid black; width:500px; margin:0 auto;">
    <form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
        <input type="file" name="fileimage"  />
        <input type="button" id="imageAddBtn" value="추가">
    </form>
</div>
<%@ include file="../footer.jsp" %>