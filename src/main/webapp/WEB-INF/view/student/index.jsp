<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index.jsp
    Created on : May 1, 2017, 5:51:46 PM
    Author     : pncht
--%>

<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/Content/student/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/Content/student/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/Content/student/vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/Content/student/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Main css --->
<link href="${pageContext.request.contextPath}/Content/student/css/main.css" rel="stylesheet" type="text/css">



<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/student/index">Student Page</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">

            <!-- /.dropdown -->

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/petition"><i class="fa fa-fw fa-file-text"></i> Petition Forms</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/student/task"><i class="fa fa-fw fa-tasks"></i> Tasks</a>
                    </li>   
                    <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper" >

        <c:if test="${(empty petitionform) && (empty task)}">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Student Petition.</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <a style='color: black;font-size: 15px'>Student petitions are filed for consideration of exception to a University policy. The Policies and Procedures for the Student
                Petition have been established by Assumption University Office Of The University Registrar.<br></br></a>
            <a style='color: black;font-size: 15px'>To select your petition request please click "Petition Forms" at the left menu bar.</a>

        </c:if>

        <c:if test="${!empty petitionform}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Petition Forms</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Form List
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- Nav tabs -->

                        <ul class="nav nav-pills">
                            <c:forEach var="p" items="${petitionform}">
                                <li><a href="#${p.getName()}-pills" data-toggle="tab" onclick="load_form('#${p.getName()}-pills', '${p.getFormPath()}')">${p.getName()}</a>
                                </li>
                            </c:forEach>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <c:forEach var="p" items="${petitionform}">
                                <div class="tab-pane fade" id="${p.getName()}-pills">

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </c:if>

        <c:if test="${!empty task}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Tasks</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>

            <div class="col-lg-6">
                <div class="panel panel-black">
                    <div class="panel-body">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>Task Name</th>
                                    <th>Date</th>
                                    <th>Percent</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${plist}">
                                    <tr>
                                        <td>Petition</td>
                                        <td>${p.getId().getSubmitTime()}</td>
                                        <td>
                                            <div class="progress progress-striped active" style="width: 100%;">
                                                <div class="progress-bar progress-bar-${p.getStatus()}" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${(p.getCurrentStage()*100)+10}%;"></div>
                                            </div>
                                        </td>
                                        <td><span class="label label-sm label-${p.getStatus()}">${p.getStatus()}</span></td>
                                    </tr>
                                </c:forEach>

                                <c:forEach var="c" items="${clist}">
                                    <tr>
                                        <td>Change Section</td>
                                        <td>${c.getId().getSubmitTime()}</td>
                                        <td>
                                            <div class="progress progress-striped active" style="width: 100%;">
                                                <div class="progress-bar progress-bar-${c.getStatus()}" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${(c.getCurrentStage()*100)+10}%;"></div>
                                            </div>
                                        </td>
                                        <td><span class="label label-sm label-${c.getStatus()}">${c.getStatus()}</span></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Modal POPUP -->
        <div class="modal fade" id="popUp" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">INFO</h4>
                    </div>
                    <div class="modal-body">
                        <p>You have submitted the form successfully!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Done</button>
                    </div>
                </div>
            </div>
        </div>
        <!------------------>
    </div>
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->
<script>

    function load_form(id, path) {
        $(id).load("${pageContext.request.contextPath}/Content/student/formtype/" + path);
    }

    $('form').on('submit', function () {
        alert(123);
        //$('#popUp').modal();
    });
</script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/Content/student/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/Content/student/vendor/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/Content/student/vendor/morrisjs/morris.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/Content/student/js/sb-admin-2.js"></script>




