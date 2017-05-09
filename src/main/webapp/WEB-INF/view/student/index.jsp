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

<link href="${pageContext.request.contextPath}/Content/student/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/Content/student/css/bootstrap.min.css" rel="stylesheet" type="text/css">



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
                    <a style="right: auto">
                        <img src="${userPicture}" class="img-circle"width="130" height="130">
                    </a><br></br>
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
                    <div class="col-lg-10">
                        <h1 class="page-header">Tasks</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>

            <div class="container" style="margin-right: 12cm">
                <div id="toolbar"></div>
                <table id="myTable" data-toggle="table" data-detail-view="true" data-detail-formatter="detailFormatter">
                    <thead>
                        <tr>
                            <th>Task Name</th>
                            <th>Date</th>
                            <th>Percent</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var = "countRow" value="${0}"/>
                        <!--/Loop p list -->
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
                        <span style="display: none;" id="desc${countRow}">
                            <div>
                                <h4>Request option : 
                                    <c:if test="${p.getRequestOption()==1}">
                                        CHANGE FACULTY/MAJOR
                                    </c:if>
                                    <c:if test="${p.getRequestOption()==2}">
                                        CHANGE ADDRESS
                                    </c:if>
                                    <c:if test="${p.getRequestOption()==3}">
                                        OTHER 
                                    </c:if>
                                </h4>
                                <h4>Request message :-</h4>
                                <textarea name="requestmessage" class="form-control" rows="5" readonly>${p.getRequestMessage()}</textarea>
                                <h4>Request reason :-</h4>
                                <textarea name="requestreason" class="form-control" rows="5" readonly>${p.getRequestReason()}</textarea>
                            </div>
                        </span>
                        <c:set var = "countRow" value="${countRow+1}"/>
                    </c:forEach>
                    <!--End Loop p list -->

                    <!--/Loop c list -->
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
                        <span style="display: none;" id="desc${countRow}">
                            <div>
                                <h4>Request option : 
                                    <c:if test="${c.getRequestOption()==1}">
                                        Normal Section
                                    </c:if>
                                    <c:if test="${c.getRequestOption()==2}">
                                        Full Section 
                                    </c:if>
                                </h4>
                                Course Number : ${c.getCourseNumber()} <br>
                                Section Number : ${c.getSectionNumber()}
                                <h4>Request message :-</h4>
                                <textarea name="requestmessage" class="form-control" rows="5" readonly>${c.getRequestMessage()}</textarea>
                            </div>
                        </span>
                        <c:set var = "countRow" value="${countRow+1}"/>
                    </c:forEach>
                    <!--End Loop c list -->
                    </tbody>
                </table>
            </div>
        </c:if>


        <div style="height: 50px;"></div>
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

    function Check_Option(id) {
        alert(id);
    }

    var $table = $('#myTable');

    $table.on('expand-row.bs.table', function (e, index, row, $detail) {
        var res = $("#desc" + index).html();
        $detail.html(res);
    });

    $table.on("click-row.bs.table", function (e, row, $tr) {

        // prints Clicked on: table table-hover, no matter if you click on row or detail-icon
        console.log("Clicked on: " + $(e.target).attr('class'), [e, row, $tr]);

        // In my real scenarion, trigger expands row with text detailFormatter..
        //$tr.find(">td>.detail-icon").trigger("click");
        // $tr.find(">td>.detail-icon").triggerHandler("click");
        if ($tr.next().is('tr.detail-view')) {
            $table.bootstrapTable('collapseRow', $tr.data('index'));
        } else {
            $table.bootstrapTable('expandRow', $tr.data('index'));
        }
    });
</script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/Content/student/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/Content/student/vendor/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/Content/student/vendor/morrisjs/morris.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/Content/student/js/sb-admin-2.js"></script>

<script src="${pageContext.request.contextPath}/Content/student/js/bootstrap-table.min.js"></script>





