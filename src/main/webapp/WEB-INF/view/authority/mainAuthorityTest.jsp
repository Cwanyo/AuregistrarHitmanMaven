<%-- 
    Document   : mainAuthorityTest
    Created on : Apr 11, 2017, 5:38:26 PM
    Author     : C.wan_yo
--%>

<h1>Authority</h1>

<img src="${userPicture}" class="img-circle"> <br>
id : ${authorityInfo.getId()} <br>
first name : ${authorityInfo.getFirstName()} <br>
last name : ${authorityInfo.getLastName()}<br>
faculty : ${authorityInfo.getFaculty().getName()}<br>

role : ${authorityInfo.getRole()}<br>


<a href="${pageContext.request.contextPath}/Logout">Log out</a>
