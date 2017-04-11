<%-- 
    Document   : mainStudentTest
    Created on : Apr 11, 2017, 5:34:37 PM
    Author     : C.wan_yo
--%>

<h1>Student</h1>


<img src="${userPicture}" class="img-circle"> <br>
id : ${studentInfo.getId()} <br>
first name : ${studentInfo.getFirstName()} <br>
last name : ${studentInfo.getLastName()}<br>
faculty : ${studentInfo.getFaculty().getName()}<br>

<a href="${pageContext.request.contextPath}/Logout">Log out</a>



