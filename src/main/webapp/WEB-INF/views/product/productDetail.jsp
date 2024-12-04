<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../header.jsp" %>

<section>
        <div class="sub_img"></div>
        <article>
            <h1>${product.title}</h1>
            <form method="post" name="formm">
                <div class="itemdetail-img-title">
                    <img src="http://placehold.co/300x300">
                    <div class="title-content">
                        <div id="title">
                            <h2>${product.title}title..........</h2>
                        </div>
                        <div id="content">
                            <h4>content 입니다..........</h4>
                        </div>
                        <div class="price">
                            <h3>${product.price} price원 </h3>
                            <input  type="hidden" name="cseq" value="${product.cseq}">
                        </div>
                        <input type="button" class="apply_btn" value="신청하기" onclick="go_orderOne()">
                    </div>

                </div>
<%--                <div id="itemdetail">--%>
<%--                    <div class="btn">--%>
<%--                        <button type="button" class="heart">--%>
<%--                            <img src="/images/heart.png" alt="찜하기">--%>
<%--                        </button>--%>
<%--                        <input type="button" class="apply_btn" value="신청하기" onclick="go_orderOne()">--%>
<%--                        <input type="button" value="메인으로" onclick="location.href='/'">--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div id="product-detail">

                </div>
            </form>
        </article>
</section>

<%@ include file="../footer.jsp" %>