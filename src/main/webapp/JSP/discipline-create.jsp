<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discipline Creating</title>
    <link rel="stylesheet" href="../recourses/css/style.css">
</head>

<body>
<table class="one">
    <thead>
    <tr>
        <td style="text-align: center;"><big>Система управления студентами и их
            успеваемостью</big></td>
    </tr>
    </thead>
</table>
<p style="margin-left: 1250px; margin-top: -20px;">
    <c:choose>
        <c:when test="${isLogin eq 1}">
            <a href="/logout">${login},Logout</a>

        </c:when>
        <c:otherwise>
            <a href="/login">Login</a>

        </c:otherwise>

    </c:choose>
</p>
<a href="/">На главную</a>
<a href="/disciplines">Назад</a>

<span style="margin-left:152px; font-family: cursive;"><big>Для того чтобы создать новую дисциплину заполните все поля и нажмите кнопку "Создать"</big> </span>
<br>
<br>
<br>

<form style="margin-left: 290px; font-family: cursive; word-spacing: 15px;"
      action="/discipline-create" method="post">

    <tr style="margin: 10px;"><small>Название</small></tr>
    <input type="text" name="discipline">
    <input

            style="font-family: cursive; border-color: dimgray; width: 90px;background-color: darkgray; margin-left: 370px; margin-top: 18px;"
            type="submit" value="Создать"></form>
<c:if test="${error=='1'}">
<h4>Поля не должны быть пустыми!!!</h4>
</c:if>
</body>

</html>