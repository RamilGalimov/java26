<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Term Creating </title>
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
<a href="/terms">Назад</a>
<span style="margin-left:152px; font-family: cursive;"><big>Для создания семестра заполните следующие данные и нажмите кнопку"Создать"</big> </span>
<br>
<br>
<br>
<form action="/term-create" method="post">

    <tr style="margin: 10px;"><small>Длительность (в неделях)</small></tr>


    <input style="font-family: cursive; font-size: 11px;" name="duration" type="text">


    <p style="margin: 20px; margin-left: 285px; font-family: cursive;"><small>Дисциплины в семестре</small></p>


    <p><select style="font-family: cursive; width: 220px;margin-left: 459px; margin-top: -35px;" size="8" multiple
               name="idsDisc">

        <C:forEach items="${disciplines}" var="d">
            <option value="${d.id}">${d.discipline}</option>
        </C:forEach>

    </select></p>


    <input
            style="font-family: cursive; border-color: dimgray; width: 90px;background-color: darkgray; margin-left: 459px; margin-top: 10px;"
            type="submit" value="Создать"></form>
</body>
</html>