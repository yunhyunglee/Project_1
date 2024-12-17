<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="contract-wrap">
	<section class="contract-section">
		<h2 id="contract-title">회원 가입 약관</h2>
		<p id="contract-intro">
			회원 유형을 선택하고 약관에 동의해주세요.
		</p>

		<!-- 약관 내용 -->
		<form method="get" name="contract">
			<!-- 회원 유형 선택 (카드 형태) -->
			<div class="member-card-container">
				<div id="personal-member-card" class="member-card" onclick="selectMemberType('personal-member-card')">
					<h3>👤 일반 회원</h3>
					<p>개인으로 서비스 이용 시 선택하세요.</p>
					<input type="radio" name="membertype" id="personal-member" value="personal" hidden>
				</div>
				<div id="business-member-card" class="member-card" onclick="selectMemberType('business-member-card')">
					<h3>🏢 사업자 회원</h3>
					<p>사업자로서 서비스 이용 시 선택하세요.</p>
					<input type="radio" name="membertype" id="business-member" value="business" hidden>
				</div>
			</div>
			<div class="terms-box">
				<div class="terms-content">
					<p id="terms-purpose">
					제 1 조 (목적)
					본 약관은 (주)제이피이노베이션(이하 “회사”라 합니다)이 운영하는 웹사이트 ‘어반런드렛’
					(http://localhost:8070/) (이하 “웹사이트”)에서 제공하는 서비스의 이용 조건 및 절차,
					이용자와 회사의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
					</p>
					<p id="terms-usage">
					제 2 조 (서비스 이용)
					회원이 되고자 하는 자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의함으로써
					회원가입을 신청합니다. 회사는 제1항에 따라 회원가입을 신청한 자가 다음 각 호에 해당하지 않는 한
					회원으로 등록합니다. “웹사이트”란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래 할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
					“이용자”란 “웹사이트”에 접속하여 서비스를 이용하는 회원 및 비회원을 말합니다.
					“회원”이라 함은 “웹사이트”에 개인정보를 제공하여 회원등록을 한 자로서, “웹사이트”의 정보를 지속적으로 제공받으며, “웹사이트”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
					“비회원”이라 함은 회원에 가입하지 않고, “웹사이트”이 제공하는 서비스를 이용하는 자를 말합니다.
					“ID”라 함은 이용자가 회원가입당시 등록한 사용자 “개인이용문자”를 말합니다.
					“멤버십”이라 함은 회원등록을 한 자로서, 별도의 온/오프라인 상에서 추가 서비스를 제공 받을 수 있는 회원을 말합니다.<br>
					</p>
					<p id="terms-conditions">
					제 3 조 (약관의 공시 및 효력과 변경)<br>
					본 약관은 회원가입 화면에 게시하여 공시하며 회사는 사정변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다
					본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.<br><br>
					제 4 조 (약관 외 준칙)<br>
					본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.<br><br>
					제 2 장 이용계약<br>
					제 5 조 (이용신청)<br>
					이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 ‘확인’ 버튼을 누르면 이용신청을 할 수 있다.
					이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.
					실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.<br><br>
					제 6 조 (이용신청의 승낙)<br>
					회사는 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.
					회사는 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.
					가. 서비스 관련 설비에 여유가 없는 경우
					나. 기술상 지장이 있는 경우
					다. 기타 회사 사정상 필요하다고 인정되는 경우
					회사는 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.
					가. 다른 사람의 명의를 사용하여 신청한 경우
					나. 이용자 정보를 허위로 기재하여 신청한 경우
					다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
					라. 기타 회사가 정한 이용신청 요건이 미비한 경우<br><br>
					제 3 장 계약 당사자의 의무<br>
					제 7 조 (회사의 의무)<br>
					회사는 사이트를 안정적이고 지속적으로 운영할 의무가 있다.
					회사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정될 경우에는 즉시 처리해야 한다. 단, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 공지사항 또는 전자우편을 통해 통보해야 한다.
					제1항의 경우 수사상의 목적으로 관계기관 및 정보통신윤리위원회의 요청이 있거나 영장 제시가 있는 경우, 기타 관계 법령에 의한 경우는 예외로 한다.
					</p>
				</div>
			</div>

			<!-- 약관 동의 -->
			<div class="radio-group contract-radio-group">
				<label>
					<input type="radio" name="okon" value="agree"> 동의합니다
				</label>
				<label>
					<input type="radio" name="okon" value="disagree" checked> 동의하지 않습니다
				</label>
			</div>

<%--			<!-- 회원 유형 선택 -->--%>
<%--			<div class="radio-group contract-radio-group">--%>
<%--				<label>--%>
<%--					<input type="radio" name="membertype" value="personal"> 일반 회원--%>
<%--				</label>--%>
<%--				<label>--%>
<%--					<input type="radio" name="membertype" value="business"> 사업자 회원--%>
<%--				</label>--%>
<%--			</div>--%>


			<!-- Next 버튼 -->
			<div class="submit-btn-group">
				<input type="button" class="contract-submit-btn" value="다음으로" onclick="goNext()">
			</div>
		</form>
	</section>
</div>
<%@ include file="../footer.jsp" %>