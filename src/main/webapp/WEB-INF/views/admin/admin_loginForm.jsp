<%--
  Created by IntelliJ IDEA.
  User: fbdls
  Date: 24. 12. 4.
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/css/loginForm.css" />
</head>
<body>

<section>

    <article>
        <form method="post" action="adminlogin" name="loginForm" >
            <h2>LogIn</h2>
            <div class="field">
                <label>User ID</label><input name="id" type="text"/>
            </div>
            <div class="field">
                <label>Password</label><input name="pwd" type="password" >
            </div>
            <div class="btn">
                <input type="submit" value="LOGIN">
            </div>
            <div style="font-size:80%; font-weight:bold">${message} </div>

        </form>
    </article>

</section>

</body>
</html>
