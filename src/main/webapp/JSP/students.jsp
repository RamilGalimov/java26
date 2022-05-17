<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Students List</title>
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
    <p>
        <input
                style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 330px; font-size: small; margin-left: 280px;"
                type="submit" value="Просмотреть успеваемость выбранных студентов" onclick="progressStudents()">
        <br>

        <c:if test="${role eq 1}">
        <input
                style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 330px; font-size: small; margin-left: 280px;"
                type="button" value="Модифицировать выбранного студента..." onclick="modifyStudents()">
        <br>

    </p>

    <div style="" class="conteiner">
        <form action="/student-create"><input
                style="font-family: cursive; border-color: dimgray; width: 220px;background-color: darkgray; font-size: small; margin-left: 650px; margin-top: -100px;"
                type="submit" value="Создать студента..."></form>
        <br>
        <input style="font-family: cursive; border-color: dimgray; background-color: darkgray; width: 220px; font-size: small;margin-left: 650px; margin-top: -100px;"
               type="submit" value="Удалить выбранных студентов" onclick="deleteStudents()">
    </div>
    </c:if>
    <h3 style="margin-left:280px; margin-top: 50px; font-family: cursive;">Список студентов</h3>
    <table class="four">
        <thead>
        <tr style="background-color: darkgray;">
            <th></th>
            <th>Фамилия</th>
            <th>Имя</th>
            <th>Группа</th>
            <th>Дата поступления</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="st">
            <tr>
                <td>
                    <input name="idStudent" type="checkbox" value="${st.id}">
                </td>
                <td>${st.surname}</td>
                <td>${st.name}</td>
                <td>${st.group}</td>
                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${st.date}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </body>
    <form action="/student-delete" method="post" id="deleteForm">
        <input type="hidden" id="deleteHidden" name="deleteHidden">

    </form>

    <form action="/student-modify" method="get" id="modifyForm">
        <input type="hidden" id="modifyHidden" name="modifyHidden">

    </form>

    <form action="/student-progress" method="get" id="progressForm">
        <input type="hidden" id="progressHidden" name="progressHidden">

    </form>
    </html>