<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ShowStudents
    Created on : Apr 4, 2017, 8:54:28 PM
    Author     : C.wan_yo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Students</title>
    </head>
    <body>
        <h1>Student List</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Address</th>
                    <th>Phone Number</th>
                    <th>Religion</th>
                    <th>Nationality</th>
                    <th>Credit</th>
                    <th>Gpa</th>
                    <th>Faculty</th>
                    <th>Major</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td>${student.getId()}</td>
                        <td>${student.getEmail()}</td>
                        <td>${student.getFirstName()}</td>
                        <td>${student.getLastName()}</td>
                        <td>${student.getAddress()}</td>
                        <td>${student.getPhoneNumber()}</td>
                        <td>${student.getReligion()}</td>
                        <td>${student.getNationality()}</td>
                        <td>${student.getCredit()}</td>
                        <td>${student.getGpa()}</td>
                        <td>${student.getFaculty().getName()}</td>
                        <td>${student.getMajor().getName()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
