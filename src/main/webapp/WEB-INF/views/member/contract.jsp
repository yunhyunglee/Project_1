<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<section>

	<article>
		<form  method="get" name="contract">

			<h2>회원 가입 약관 </h2>
			<p>제 1 조 (목적)
				이 약관은 [서비스명]이 제공하는 서비스의 이용 조건 및 절차, 이용자와 서비스 제공자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.

				제 2 조 (회원가입)
				1. 회원이 되고자 하는 자는 [서비스명]이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
				2. [서비스명]은 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
				- 가입 신청자가 이 약관 제5조 제2항에 의하여 이전에 회원 자격을 상실한 적이 있는 경우
				- 등록 내용에 허위, 기재누락, 오기가 있는 경우
				- 기타 회원으로 등록하는 것이 [서비스명]의 기술상 현저히 지장이 있다고 판단되는 경우
			</p>
			<div class="ta"><textarea rows="15">... 약관 전문 ...</textarea></div>
			<div class="rb">
				    <input type="radio" name="okon"  > 동의함 &nbsp; &nbsp; &nbsp;
				    <input type="radio" name="okon" checked> 동의안함
			</div>
			<div class="rb">
				<input type="radio" name="membertype" > 개인이용자 &nbsp; &nbsp; &nbsp;
				<input type="radio" name="membertype" > 사업자
			</div>
			<div class="btn">
			  		<input type="button" value="Next" onClick="goNext()">
			</div>
		</form>
	</article>
</section>

 <%@ include file="../footer.jsp" %>