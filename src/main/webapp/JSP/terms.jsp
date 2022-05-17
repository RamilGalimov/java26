<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms List</title>
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
    <a href="/logout">Logout</a>
</p>
<a href="/">На главную</a>
<br>

<!--
    <p style="margin-left: 730px; margin-top: -600px; font-family: cursive;"><strong>Выбрать семестр</strong></p> -->

<p style="margin-left: 285px; font-family: cursive;"><strong>Выбрать семестр</strong></p>
<form action="/terms" method="get">
    <select style="margin-left: 900px; font-family: cursive;" name="idSelectedTerm">
        <c:forEach items="${terms}" var="t">
            <c:choose>
                <c:when test="${t.id eq selectedTerm.id}">
                    <option selected value="${t.id}">${t.term}</option>
                </c:when>
                <c:otherwise>
                    <option value="${t.id}">${t.term}</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
    <div style="margin-left: 550px;font-family: cursive; ">


        <input style="font-family: cursive;border-color: dimgray;background-color: darkgray; width: 90px;" type="submit"
               value="Выбрать">

    </div>
</form>


<p style="font-family: cursive; margin-left: 285px;"><b>Длительность семестра: ${selectedTerm.duration}</b></p>
<br>


<span style="margin-left:285px; font-family: cursive;"><b>Список дисциплин </b>
    </span>
<br>
<br>
<table class="seven">
    <thead>
    <tr style="background-color: darkgray;">
        <th>Наименования дисциплины</th>
    </tr>

    <c:forEach items="${disciplines}" var="d">
        <tr>
            <td>${d.discipline}</td>
        </tr>
    </c:forEach>
    </thead>
</table>
<p style="margin-top: -615px;">
<form action="/term-create" method="get"><input
        style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 320px;margin-left: 750px;"
        type="submit" value="Создать семестр..."></form>
<br>
<form action="/term-modify" method="get">
    <input type="hidden" name="idTermToModify" value="${selectedTerm.id}">
    <input
        style="font-family: cursive; border-color: dimgray; width: 320px;background-color: darkgray; margin-left: 750px;"
        type="submit" value="Модифицировать текущий семестр..."></form>
<br>
<form action="/delete-term" method="get">
   <input type="hidden" name="idTermToDelete" value="${selectedTerm.id}">

    <input
        style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 320px;margin-left: 750px;"
        type="submit" value="Удалить текущий семестр"></form>
</p>
</body>

</html>