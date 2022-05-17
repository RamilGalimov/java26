<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Progress</title>
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
<a href="/students">Назад</a>

<span style="margin-left:152px; font-family: cursive;"><big>Отображена успеваемость для следующего студента: </big>
    </span>
<br>
<br>


<table class="six">
    <thead>
    <tr style="background-color: darkgray;">
        <th>Фамилия</th>
        <th>Имя</th>
        <th>Группа</th>
        <th>Дата поступления</th>
    </tr>
    <tr>

        <td>${student.surname}</td>
        <td>${student.name}</td>
        <td>${student.group}</td>
        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${student.date}"/></td>
    </tr>
    </thead>
</table>
<br>
<br>
<br>
<table class="seven">
    <thead>
    <tr style="background-color: darkgray;">
        <th>Дисциплина</th>
        <c:if test="${haveMarks eq 1}">
            <th>Оценка</th>
        </c:if>
    </tr>
    <c:forEach items="${marks}" var="m" varStatus="loop">
        <tr>
            <td>${m.discipline.discipline}</td>
            <c:if test="${m.mark ne -1}">
                <td>${m.mark}</td>
            </c:if>
        </tr>

    </c:forEach>


    </thead>
</table>
<p style="margin-left: 730px; margin-top: -600px; font-family: cursive;"><strong> Выбрать семестр </strong></p>

<form action="/student-progress" method="get">
    <input type="hidden" name="progressHidden" value="${student.id}">

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
    <div style="margin-left: 1000px;font-family: cursive;">
        <input style="border-color: dimgray;background-color: darkgray; width: 90px; font-family: cursive;"
               type="submit" value="Выбрать">
    </div>

</form>
<p style="font-family: cursive; margin-left: 730px;"><b> Средняя оценка за семестр:<fmt:formatNumber pattern="0.00"
                                                                                                     value="${avarage}"></fmt:formatNumber>
    балла</b>
</p>


</body>

</html>