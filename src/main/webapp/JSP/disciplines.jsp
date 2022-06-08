<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disciplines’ List
    </title>
    <link rel="stylesheet" href="../recourses/css/style.css">
    <script src="../recourses/js/function.js"></script>
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

<br>
<span style="margin-left:285px; font-family: cursive;"><b>Список дисциплин </b>
    </span>
<br>
<br>
<table class="seven">
    <thead>
    <tr style="background-color: darkgray;">
        <th></th>
        <th>Наименование дисциплины</th>
    </tr>
    <c:forEach items="${disciplines}" var="dis">
        <tr>
            <td>
                <input name="idDiscipline" type="checkbox" value="${dis.id}">
            </td>
            <td>${dis.discipline}</td>
        </tr>
    </c:forEach>
    </thead>
</table>

<p style="margin-top: -615px;">

    <c:if test="${role eq 1}">
<form action="discipline-create">
    <input
            style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 320px;margin-left: 750px;"
            type="submit" value="Создать дисциплину..."></form>
<br>



    <input
            style="font-family: cursive; border-color: dimgray; width: 320px;background-color: darkgray; margin-left: 750px;"
            type="submit" value="Модифицировать выбранную дисциплину..." onclick="modifyDisciplines()">
    <br>
    <input
            style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 320px;margin-left: 750px;"
            type="submit" value="Удалить выбранную дисциплину..." onclick="deleteDisciplines()">
</c:if>
</p>


</body>


<form action="/discipline-delete" method="post" id="deleteForm">

    <input type="hidden" id="deleteHidden" name="deleteHidden">

</form>

<form action="/discipline-modify" method="get" id="modifyForm">

    <input type="hidden" id="modifyHidden" name="modifyHidden">

</form>

</html>